/*****************************************************************************
**
**  Name:           wm_bt_wifi.c
**
**  Description:    This file contains the  implemention of wifi configuration with BLE
**
*****************************************************************************/

#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <assert.h>

#include "wm_bt_config.h"

#if (WM_NIMBLE_INCLUDED == CFG_ON)

#include "wm_crypto_hard.h"
#include "wm_debug.h"
#include "wm_netif.h"
#include "wm_mem.h"
#include "utils.h"
#include "list.h"

#include "wm_bt.h"
#include "wm_bt_app.h"
#include "wm_bt_util.h"
#include "host/ble_hs.h"
#include "wm_ble_server_wifi_prof.h"
#include "mbedtls/pk.h"

/*
 * DEFINES
 ****************************************************************************************
 */


#define ENC_FLAG_VALID_BIT     (0x01<<7)
#define ACK_FLAG_VALID_BIT     (0x01<<6)
#define MRE_FLAG_VALID_BIT     (0x01<<5)
//#define PAYLOAD_FRAGMENT_LENGTH       15
static int PAYLOAD_FRAGMENT_LENGTH = 15;

/*opcode, seq, flag, no, crc*/
#define ATTACHED_LENGTH               5

#define DEFAULT_SEND_FLAG        0x00

#define DISCONNECT_TIME_OUT     (60*1000)
#define WIFI_REPORT_IP_TIME_OUT (15*1000)

#define CONFIG_STA_CMD                0x0A
#define CONFIG_SOFTAP_CMD             0x0B
#define CONFIG_STA_SOFTAP_CMD         0x0C
#define CONFIG_INQUIRY_CMD            0x0D
#define CONFIG_WIFI_SCAN_CMD          0x0E
#define CONFIG_KEY_EXCHANGE_CMD       0x0F

#define ACK_TO_APP                    0x90
#define ACK_FROM_APP                  0x10

#define ERROR_STATUS_SUCCESS          0x00
#define ERROR_STATUS_PARAMETER_ERROR  0x01
#define WIFI_AUTO_RECONNECT_ENABLE    1

#define AES_BLOCK_SIZE 16

/*
 * STRUCTURE DEFINITIONS
 ****************************************************************************************
 */

typedef struct
{
	struct dl_list list;
    uint8_t *buffer;
    uint8_t *cached_buffer; /*cache the last timer sent out msg*/
    uint16_t cached_buffer_length;
    uint16_t total_len;
    uint16_t offset;
    uint8_t flag;
    uint8_t opcode;
    uint8_t retry_count;
    bool pending;
} msg_buffer_t;

typedef enum
{
	WIFI_CONFIG_IDLE,
	WIFI_CONFIG_PENDING,
	WIFI_CONFIG_END_SUCCESS,
	WIFI_CONFIG_END_FAILED,
} wm_wifi_config_state_t;

/*
 * GLOBAL VARIABLE DEFINITIONS
 ****************************************************************************************
 */

static uint8_t recv_sequence = 0;
static uint8_t send_sequence = 0;

static msg_buffer_t cmd_buffer;
static msg_buffer_t rsp_buffer;

static struct dl_list *rsp_list = NULL;

static bool g_sending_pending = false;

static struct ble_npl_callout g_rsend_timer;
static struct ble_npl_callout g_wait_netup_timer;
static struct ble_npl_callout g_disconnect_timer;
static struct ble_npl_callout g_defer_report_timer;

#if WIFI_AUTO_RECONNECT_ENABLE
static struct ble_npl_callout g_wifi_reconnect_timer;
#endif

static volatile wm_wifi_config_state_t g_wifi_config_success = WIFI_CONFIG_IDLE;

static uint8_t g_fd = 0;
static uint8_t priv_key[16];
static int8_t g_bt_wifi_service_enabled = 0;
static uint8_t g_wifi_config_re_enable = 0;
static uint8_t auto_reconnect = WIFI_AUTO_CNT_OFF;

/*
 * LOCAL FUNCTION DECLARATIONS
 ****************************************************************************************
 */

static bool check_sending_list_and_send();
static void resend_app_msg(uint8_t *ptr, int length);
static int wm_ble_wifi_cfg_disconnected_cb(int status);


/*
 * LOCAL FUNCTION DEFINITIONS
 ****************************************************************************************
 */

static int PKCS7Padding(unsigned char *str, int len)
{
    int remain, i;
    remain = 16 - len % 16;

    //printf("remain = %d\n",remain);
    for(i = 0; i < remain; i++)
    {
        str[len + i] = remain;
        //printf("str[len+i]= %d\n",str[len+i]);
    }

    str[len + i] = '\0';
    return len + remain;
}
static int DePKCS7Padding(unsigned char *str, int len)
{
    int remain = str[len - 1];//��ȡ���ĸ���
    return len - remain;
}
static int bt_aes_decrypt(uint8_t *key, uint8_t *src_ptr, int length, uint8_t *dest_ptr)
{
    int ret = -1;
    psCipherContext_t ctx;
    uint8_t *buf = NULL;
    TLS_DBGPRT_INFO("original data:");
    TLS_DBGPRT_DUMP(src_ptr, length);

    if(key == NULL || src_ptr == NULL || length % 16 != 0)
    {
        goto out;
    }

    buf = tls_mem_alloc(length);

    if(NULL == buf)
    {
        goto out;
    }

    MEMCPY(buf, src_ptr, length);
    TLS_DBGPRT_INFO("aes key:");
    TLS_DBGPRT_DUMP(key, 16);

    if(tls_crypto_aes_init(&ctx, key, key, 16, CRYPTO_MODE_ECB) != 0)
    {
        goto out;
    }

    if(tls_crypto_aes_encrypt_decrypt(&ctx, buf, buf, length, CRYPTO_WAY_DECRYPT) < 0)
    {
        goto out;
    }

    MEMCPY(dest_ptr, buf, length);
    TLS_DBGPRT_INFO("decrypt data:");
    TLS_DBGPRT_DUMP(dest_ptr, length);
    ret = DePKCS7Padding(dest_ptr, length);
out:

    if(buf)
    {
        tls_mem_free(buf);
    }

    return ret;
}
static int rng_func(void *ctx, unsigned char *out, size_t len)
{
	tls_crypto_random_init(0, CRYPTO_RNG_SWITCH_16);
	tls_crypto_random_bytes(out, len);
	tls_crypto_random_stop();
	return 0;
}
static int bt_rsa_encrypt(uint8_t *pub_key, int pubkey_size, uint8_t *src_ptr, int length, uint8_t *dest_ptr, int dest_len)
{
    int ret = -1;

    mbedtls_pk_context ctx_pk;
	unsigned char *p = pub_key;
	size_t olen = 0;
	mbedtls_pk_init(&ctx_pk);

	ret = mbedtls_pk_parse_subpubkey( &p, p + pubkey_size, &ctx_pk );
	if(ret)
	{
		printf("Can't import public key %d\n ", ret);
		goto out;
	}
	ret = mbedtls_pk_encrypt(&ctx_pk, src_ptr, length, dest_ptr, &olen, dest_len, rng_func, NULL);
	if(ret)
	{
		printf("rsa encrypt fail %d\n ", ret);
		goto out;
	}
out:
	mbedtls_pk_free(&ctx_pk);

    return ret;
}
static int bt_aes_encrypt(uint8_t *key, uint8_t *src_ptr, int length, uint8_t *dest_ptr)
{
    int ret = -1;
    int len = 0;
    psCipherContext_t ctx;
    unsigned char *aes_encode_temp = NULL;
    TLS_DBGPRT_INFO("original data:");
    TLS_DBGPRT_DUMP(src_ptr, length);
    aes_encode_temp = tls_mem_alloc(length + 16);

    if(aes_encode_temp == NULL)
    {
        goto out;
    }

    memset(aes_encode_temp, 0, length + 16);
    memcpy(aes_encode_temp, src_ptr, length);
    len = PKCS7Padding(aes_encode_temp, length);

    if(tls_crypto_aes_init(&ctx, key, key, 16, CRYPTO_MODE_ECB) != 0)
    {
        goto out;
    }

    if(tls_crypto_aes_encrypt_decrypt(&ctx, aes_encode_temp, dest_ptr, len, CRYPTO_WAY_ENCRYPT) < 0)
    {
        goto out;
    }

    //TLS_DBGPRT_INFO("encrypt data:");
    TLS_DBGPRT_DUMP(dest_ptr, len);
    ret = len;
out:

    if(aes_encode_temp)
    {
        tls_mem_free(aes_encode_temp);
    }

    return ret;
}

static void wm_ble_wifi_cfg_disconnect(struct ble_npl_event *ev)
{
    TLS_BT_APPL_TRACE_DEBUG("wm_ble_wifi_cfg_disconnect\r\n");
    int reason = 0;
    
    if(g_wifi_config_success == WIFI_CONFIG_END_SUCCESS)
    {
        reason = 1;
    }

    if(g_wifi_config_success != WIFI_CONFIG_END_SUCCESS)
    {
        g_wifi_config_re_enable = 1;
    }
    tls_ble_wifi_prof_disconnect(reason);
}
static void free_rsp_content(msg_buffer_t *rsp)
{
	if(rsp)
	{
    	if(rsp->buffer)
    	{
        	tls_mem_free(rsp->buffer);
    	}

    	if(rsp->cached_buffer)
    	{
        	tls_mem_free(rsp->cached_buffer);
    	}
		tls_mem_free(rsp);	
	}
	
}

void send_app_msg_wait_ack_timeout_cb(struct ble_npl_event *ev)
{
    if(g_fd)
    {

		if(dl_list_empty(rsp_list))
		{
			return;
		}

        msg_buffer_t *rsp_next = NULL;
		msg_buffer_t *rsp = (msg_buffer_t *)dl_list_first(rsp_list,msg_buffer_t,list);

        if(rsp->retry_count <= 3)
        {
            rsp->retry_count++;
            TLS_BT_APPL_TRACE_DEBUG("Resend app msg[%d]\r\n", rsp->retry_count);
            assert(rsp->cached_buffer != NULL);
            return resend_app_msg(rsp->cached_buffer, rsp->cached_buffer_length);
        }
        else
        {
            TLS_BT_APPL_TRACE_WARNING("Warn, max retry count reached, remove this message, remove all left???\r\n");
            
            //list_remove(rsp_list, rsp);
            dl_list_del(&rsp->list);
			free_rsp_content(rsp);

            //By now , the communcation failed, I remove the left msg if exist;

			dl_list_for_each_safe(rsp,rsp_next,rsp_list,msg_buffer_t,list)
			{
				dl_list_del(&rsp->list);
				free_rsp_content(rsp);
			}
            //
            ///RE ADV; DISCONNECT ;
            tls_ble_wifi_prof_disconnect(0);
        }
    }
}

static void send_ack(uint8_t payload)
{
    uint8_t ack[6] = {ACK_TO_APP, 0x00, 0x00, 0x00, 0x00, 0x00};
    uint8_t crc8 = 0x00;
    ack[1] = send_sequence++;
    ack[4] = payload;
    crc8 = get_crc8(ack, 5);
    ack[5] = crc8;
    //wm_wifi_prof_send_msg(ack, 6);
    build_cmd_rsp(ACK_TO_APP,0x00,(uint8_t *)ack+4, 1);
}

int send_app_msg(uint8_t opcode, uint8_t flag, uint8_t seqno, uint8_t *ptr, int length, uint8_t *cache_buffer)
{
    //assert(length <= PAYLOAD_FRAGMENT_LENGTH); //check? SHOULD GET MAX MTU OF L2CAP
    //uint8_t msg[ATTACHED_LENGTH + PAYLOAD_FRAGMENT_LENGTH + 1] = {0};
    uint8_t msg[255] = {0};
    uint8_t offset = 0;
    uint8_t crc8 = 0x00;
    msg[offset++] = opcode;
    msg[offset++] = send_sequence++;
    msg[offset++] = flag;
    msg[offset++] = seqno;
    memcpy(msg + offset, ptr, length);
    offset += length;
    crc8 = get_crc8(msg, offset);
    msg[offset++] = crc8;
    tls_ble_wifi_prof_send_msg(msg, offset);

    if(flag & ACK_FLAG_VALID_BIT)
    {
        //bak up this message;
        memcpy(cache_buffer, msg, offset);
        //start an timer;
        ble_npl_callout_reset(&g_rsend_timer, ble_npl_time_ms_to_ticks32(1000));
    }

    return offset;
}

static void resend_app_msg(uint8_t *ptr, int length)
{
    //uint8_t msg[ATTACHED_LENGTH + PAYLOAD_FRAGMENT_LENGTH + 1];
    uint8_t msg[255] = {0};
    uint8_t crc8 = 0x00;
    memcpy(msg, ptr, length);
    msg[1] = send_sequence++;
    crc8 = get_crc8(ptr, (length - 1));
    msg[length - 1] = crc8;
    tls_ble_wifi_prof_send_msg(msg, length);
    //This must be wait ack retry resending
    //start an timeout timer;
    ble_npl_callout_reset(&g_rsend_timer, ble_npl_time_ms_to_ticks32(1000));
}


bool process_received_ack_or_send_cb(uint8_t where)
{
    bool ret = false;
    /// where: 1 means ack ; 0 means send_cb;
#define FROM_ACK 1
#define FROM_SEND_CB 0

	if(dl_list_empty(rsp_list))
	{
		return ret;
	}
	
    msg_buffer_t *rsp =	(msg_buffer_t*)dl_list_first(rsp_list,msg_buffer_t,list);
    bool processing = false;
    uint8_t left = 0;

    if(rsp)
    {
        if((rsp->flag & ACK_FLAG_VALID_BIT))
        {
            if(where == FROM_ACK)
            {
                processing = true;
                //remove timeout timer immediatelly;
                ble_npl_callout_stop(&g_rsend_timer);
            }
        }
        else
        {
            if(where == FROM_ACK)
            {
                TLS_BT_APPL_TRACE_ERROR("ERROR, Got an unexpected ack from app...\r\n");
                assert(0);
            }
            else
            {
                processing = true;
            }
        }

        if(processing)
        {
            if(rsp->offset >= rsp->total_len)
            {
                /*All data sent out*/
                dl_list_del(&rsp->list);
				free_rsp_content(rsp);
				
                ret =  check_sending_list_and_send();

                if(ret)
                {
                    TLS_BT_APPL_TRACE_DEBUG("Sent out(acked), and send left cmd\r\n");
                }
            }
            else
            {
                left = rsp->total_len - rsp->offset;

                if(left > PAYLOAD_FRAGMENT_LENGTH)
                {
                    left = PAYLOAD_FRAGMENT_LENGTH;
                }
                else
                {
                    rsp->flag &= ~MRE_FLAG_VALID_BIT;
                }

                /*send out the fragmented msg and cache it if needed */
                rsp->cached_buffer_length = send_app_msg(rsp->opcode, rsp->flag, (rsp->offset + (PAYLOAD_FRAGMENT_LENGTH - 1)) / PAYLOAD_FRAGMENT_LENGTH, rsp->buffer + rsp->offset, left, rsp->cached_buffer);
                rsp->offset += left;
                rsp->retry_count = 1;
                ret = true;
            }
        }
    }

    return ret;
}
static void triger_to_send(void *arg)
{
    check_sending_list_and_send();
}

static bool check_sending_list_and_send()
{
    int left = 0;

	if(dl_list_empty(rsp_list))
	{
		g_sending_pending = false;
		return false;
	}	

    msg_buffer_t *rsp = (msg_buffer_t *)dl_list_first(rsp_list, msg_buffer_t, list);

    if(rsp)
    {
        left = rsp->total_len - rsp->offset;

        if(left > PAYLOAD_FRAGMENT_LENGTH)
        {
            left = PAYLOAD_FRAGMENT_LENGTH;
            rsp->flag |= MRE_FLAG_VALID_BIT;
        }

        /*send out the fragmented msg and cache it */
        rsp->cached_buffer_length = send_app_msg(rsp->opcode, rsp->flag, (rsp->offset + (PAYLOAD_FRAGMENT_LENGTH - 1)) / PAYLOAD_FRAGMENT_LENGTH, rsp->buffer + rsp->offset, left, rsp->cached_buffer);
        rsp->offset += left;
        rsp->retry_count = 1;
        g_sending_pending = true;
        return true;
    }
    else
    {
        g_sending_pending = false;
        return false;
    }
}

void build_cmd_rsp(uint8_t opcode, uint8_t flag, uint8_t *ptr, int length)
{
    uint8_t *tempBuf = NULL;
    msg_buffer_t *rsp = (msg_buffer_t *)tls_mem_alloc(sizeof(msg_buffer_t));
	if(rsp == NULL)
	{
		TLS_BT_APPL_TRACE_WARNING("%s,%d, NO ENOUGH MEMORY\r\n", __FUNCTION__, __LINE__);
		return;
	}
    memset(rsp, 0, sizeof(msg_buffer_t));

    if(flag & ACK_FLAG_VALID_BIT)
    {
        rsp->cached_buffer = tls_mem_alloc(PAYLOAD_FRAGMENT_LENGTH + ATTACHED_LENGTH);
		if(rsp->cached_buffer == NULL)
		{
			TLS_BT_APPL_TRACE_WARNING("%s,%d, NO ENOUGH MEMORY\r\n", __FUNCTION__, __LINE__);
			tls_mem_free(rsp);
			return;
		}

    }

    //TODO rsa encryption here;
    if((flag & ENC_FLAG_VALID_BIT))
    {
        tempBuf = (uint8_t *)tls_mem_alloc(length + AES_BLOCK_SIZE);
		if(tempBuf == NULL)
		{
			TLS_BT_APPL_TRACE_WARNING("%s,%d, NO ENOUGH MEMORY\r\n", __FUNCTION__, __LINE__);
			tls_mem_free(rsp->cached_buffer);
			tls_mem_free(rsp);
			return;
		}

        length = bt_aes_encrypt(priv_key, ptr, length, tempBuf);
    }
    else
    {
        tempBuf = ptr;
    }

    rsp->buffer = tls_mem_alloc(length);
	if(rsp->buffer == NULL)
	{
		TLS_BT_APPL_TRACE_WARNING("%s,%d, NO ENOUGH MEMORY\r\n", __FUNCTION__, __LINE__);
		tls_mem_free(rsp->cached_buffer);
		tls_mem_free(rsp);
		if(tempBuf && tempBuf != ptr)
	    {
	        tls_mem_free(tempBuf);
	    }
		return;		
	}
	
    memcpy(rsp->buffer, tempBuf, length);
    rsp->flag = flag;
    rsp->total_len = length;
    rsp->offset = 0;
    rsp->opcode = opcode;
    dl_list_add_tail(rsp_list, &rsp->list);

    /*check busy, if not, send out immediatelly*/
    if(!g_sending_pending)
    {
        //For nimble , I just do it async send out;
        tls_bt_async_proc_func(triger_to_send, NULL,10);
    }

    if(tempBuf && tempBuf != ptr)
    {
        tls_mem_free(tempBuf);
    }
}

static void key_exchange_process(const uint8_t *payload, int length)
{
#define TLV_TYPE_PUB_KEY   0x09
    int i = 0 ;
    uint8_t resp[133] = {0x81, 0x01, 0x00, 0x87, 128, 0x00};
    //payload format: 0x87, 0x10, public key;
	if(payload[0] != TLV_TYPE_PUB_KEY)
	{
		TLS_BT_APPL_TRACE_WARNING("%s,%d, payload format error\r\n", __FUNCTION__, __LINE__);
		return;
	}

    for(i = 0; i < 16; i++)
    {
        priv_key[i] = rand() % 0xFF;
    }

    if(bt_rsa_encrypt(payload + 2, payload[1], priv_key, 16, resp + 5, 128))
    {
        resp[2] = 1;
        build_cmd_rsp(CONFIG_KEY_EXCHANGE_CMD + 0x80, DEFAULT_SEND_FLAG, resp, 3);
        return;
    }

    g_fd |= ENC_FLAG_VALID_BIT; //indicate this is an encrypted fd;
    //send back the encrypted key;
    build_cmd_rsp(CONFIG_KEY_EXCHANGE_CMD + 0x80, DEFAULT_SEND_FLAG, resp, sizeof(resp));
}

static void wm_ble_netup_event_timeout(struct ble_npl_event *ev)
{
    uint8_t resp[11] = {0x00};
    uint8_t resp_length = 0;
    unsigned char local_flag = DEFAULT_SEND_FLAG;
    resp[resp_length++] = 0x81;  //type id;
    resp[resp_length++] = 0x01;  //length;
    resp[resp_length++] = 0x03;  //variable value;
    resp[resp_length++] = 0x83;  //type id;
    resp[resp_length++] = 0x06;  //length;
    tls_get_mac_addr(resp + resp_length);
    resp_length += 6;
    build_cmd_rsp(CONFIG_STA_CMD + 0x80, local_flag, resp, resp_length);
}

   /** MACRO for callback EVENT to join AP or create soft-AP successfully  */
#define NETIF_WIFI_JOIN_SUCCESS         0x1
    /** MACRO for callback EVENT to fail to join AP */
#define  NETIF_WIFI_JOIN_FAILED          0x2
    /** MACRO for callback EVENT to disconnect from AP or destroy soft-AP */
#define NETIF_WIFI_DISCONNECTED         0x3
    /** MACRO for callbck EVENT to get IP address */
#define NETIF_IP_NET_UP                 0x4
    /** MACRO for callback EVNET to create AP successfully */
#define NETIF_WIFI_SOFTAP_SUCCESS    0x5
    /** MACRO for callback EVNET to create soft-AP failed */
#define NETIF_WIFI_SOFTAP_FAILED     0x6
    /** MACRO for callback EVNET to close soft-AP */
#define NETIF_WIFI_SOFTAP_CLOSED          0x7
    /** MACRO for callback EVNET to inform soft ap's net */
#define NETIF_IP_NET2_UP                0x8

static void report_network_status(int status)
{
    bool indication = false;
    uint8_t resp[17] = {0x00};
    uint8_t resp_length = 0;
    struct tls_ethif *ni;
    unsigned char local_flag = DEFAULT_SEND_FLAG;
	uint8_t reconnect = WIFI_AUTO_CNT_OFF;
	
	TLS_BT_APPL_TRACE_DEBUG("report_network_status, status=%d\r\n", status);

    if(g_fd == 0 || g_wifi_config_success == WIFI_CONFIG_END_FAILED || g_wifi_config_success == WIFI_CONFIG_END_SUCCESS)
    {
        return;
    }
 

    switch(status)
    {
        case NETIF_WIFI_JOIN_SUCCESS:
        case NETIF_WIFI_SOFTAP_SUCCESS:
            /**/
            ble_npl_callout_reset(&g_wait_netup_timer,ble_npl_time_ms_to_ticks32(10000));
            break;

        case NETIF_WIFI_JOIN_FAILED:
        case NETIF_WIFI_SOFTAP_FAILED:
            resp[resp_length++] = 0x81;  //type id;
            resp[resp_length++] = 0x01;  //length;
            resp[resp_length++] = 0x02;  //variable value;
            indication = true;
            g_wifi_config_success = WIFI_CONFIG_END_FAILED;
#if WIFI_AUTO_RECONNECT_ENABLE
			tls_wifi_auto_connect_flag(WIFI_AUTO_CNT_FLAG_SET, &reconnect);
			tls_wifi_disconnect();
#endif			
            break;

        case NETIF_IP_NET_UP:
            ble_npl_callout_stop(&g_wait_netup_timer);
            resp[resp_length++] = 0x81;  //type id;
            resp[resp_length++] = 0x01;  //length;
            resp[resp_length++] = 0x00;  //variable value;
            resp[resp_length++] = 0x82;  //type id;
            resp[resp_length++] = 0x04;  //length;
            ni = tls_netif_get_ethif();
            memcpy(resp + resp_length, &(ni->ip_addr.addr), 4);
            resp_length += 4;
            resp[resp_length++] = 0x83;  //type id;
            resp[resp_length++] = 0x06;  //length;
            tls_get_mac_addr(resp + resp_length);
            resp_length += 6;
            indication = true;
            g_wifi_config_success = WIFI_CONFIG_END_SUCCESS;
            break;

        default:
            indication = false;
            break;
    }

    if(indication)
    {
        if(g_fd & ENC_FLAG_VALID_BIT)
        {
            local_flag |= ENC_FLAG_VALID_BIT;
        }

        build_cmd_rsp(CONFIG_STA_CMD + 0x80, local_flag, resp, resp_length);
    }
}

#if WIFI_AUTO_RECONNECT_ENABLE
static void wm_ble_wifi_connect_timeout_cb(struct ble_npl_event *ev)
{
	TLS_BT_APPL_TRACE_DEBUG("wm_ble_wifi_connect_timeout_cb, status=%d\r\n", (int)ev->arg);

	report_network_status(NETIF_WIFI_JOIN_FAILED);
}
static void wm_ble_wifi_defer_report_network_status(struct ble_npl_event *ev)
{
   TLS_BT_APPL_TRACE_DEBUG("wm_ble_wifi_connect_timeout_cb, status=%d\r\n", (int)ev->arg); 
   report_network_status((int)ev->arg);
}

#endif

static void wm_ble_netif_status_event(uint8_t status)
{
	if(g_fd ==0) return;
	
#if WIFI_AUTO_RECONNECT_ENABLE
	/*if wifi join failed, we should wait the timeout. for the auto reconnect will work.
	   but every time wifi join failed, it will report */
	if(status != NETIF_WIFI_JOIN_FAILED)
	{
		 ble_npl_callout_stop(&g_wifi_reconnect_timer);
		
        g_defer_report_timer.ev.arg = (void*)status;
        ble_npl_callout_reset(&g_defer_report_timer,ble_npl_time_ms_to_ticks32(10));
	}else
	{
		TLS_BT_APPL_TRACE_DEBUG("netif report status=%d, wait timeout...\r\n", status);
	}
#else
	g_defer_report_timer.ev.arg = (void*)status;
    ble_npl_callout_reset(&g_defer_report_timer,ble_npl_time_ms_to_ticks32(10));
#endif	
	return;
}

static int wlan_config_process(const uint8_t *payload, int length)
{
    uint8_t resp[3] = {0x81, 0x01, 0x01}; //parameters error response;
    uint8_t *p_ssid = NULL;
    uint8_t *p_password = NULL;
    uint8_t *p_bssid = NULL;
    uint8_t ssid_length = 0, password_length = 0, bssid_length = 0;
    int offset = 0, status = -1;
    uint8_t reconnect = WIFI_AUTO_CNT_OFF;
	
    uint8_t cmd_type = payload[offset++];
    uint8_t cmd_length = payload[offset++];
#define AP_SSID 0x01
#define AP_PASSWORD 0x02
#define AP_BSSID 0x03
    g_wifi_config_success = WIFI_CONFIG_PENDING;

    while(offset < length)
    {
        switch(cmd_type)
        {
            case AP_SSID:
                p_ssid = (uint8_t *)tls_mem_alloc(cmd_length + 1);
                assert(p_ssid != NULL);
                memcpy(p_ssid, &payload[offset], cmd_length);
                p_ssid[cmd_length] = 0;
                ssid_length = cmd_length;
                break;

            case AP_PASSWORD:
                p_password = (uint8_t *)tls_mem_alloc(cmd_length + 1);
                assert(p_password != NULL);
                memcpy(p_password, &payload[offset], cmd_length);
                p_password[cmd_length] = 0;
                password_length = cmd_length;
                break;

            case AP_BSSID:
                p_bssid = (uint8_t *)tls_mem_alloc(cmd_length + 1);
                assert(p_bssid != NULL);
                memcpy(p_bssid, &payload[offset], cmd_length);
                p_bssid[cmd_length] = 0;
                bssid_length = cmd_length;
                break;

            default:
                break;
        }

        offset += cmd_length;

        if(offset >= length)
        {
            break;
        }

        cmd_type = payload[offset++];
        cmd_length = payload[offset++];
    }

    if(ssid_length != 0 && bssid_length == 0)
    {
#if WIFI_AUTO_RECONNECT_ENABLE
    	tls_wifi_auto_connect_flag(WIFI_AUTO_CNT_FLAG_GET, &auto_reconnect);
		if(auto_reconnect != WIFI_AUTO_CNT_ON)
		{
			reconnect = WIFI_AUTO_CNT_ON;
        	tls_wifi_auto_connect_flag(WIFI_AUTO_CNT_FLAG_SET, &reconnect);
		}	
#else
		tls_wifi_auto_connect_flag(WIFI_AUTO_CNT_FLAG_SET, &reconnect);		
#endif
		//tls_wifi_disconnect();
		tls_netif_add_status_event(wm_ble_netif_status_event);
        status = tls_wifi_connect(p_ssid, ssid_length, p_password, password_length);
    }

    if(ssid_length != 0  && bssid_length != 0)
    {
#if WIFI_AUTO_RECONNECT_ENABLE
		tls_wifi_auto_connect_flag(WIFI_AUTO_CNT_FLAG_GET, &auto_reconnect);
		if(auto_reconnect != WIFI_AUTO_CNT_ON)
		{
			reconnect = WIFI_AUTO_CNT_ON;
			tls_wifi_auto_connect_flag(WIFI_AUTO_CNT_FLAG_SET, &reconnect);
		}	
#else
		tls_wifi_auto_connect_flag(WIFI_AUTO_CNT_FLAG_SET, &reconnect); 	
#endif

		//tls_wifi_disconnect();
		tls_netif_add_status_event(wm_ble_netif_status_event);
        status = tls_wifi_connect_by_ssid_bssid(p_ssid, ssid_length, p_bssid, p_password, password_length);
    }

    if(ssid_length == 0 && bssid_length != 0)
    {
#if WIFI_AUTO_RECONNECT_ENABLE
    	tls_wifi_auto_connect_flag(WIFI_AUTO_CNT_FLAG_GET, &auto_reconnect);
		if(auto_reconnect != WIFI_AUTO_CNT_ON)
		{
			reconnect = WIFI_AUTO_CNT_ON;
        	tls_wifi_auto_connect_flag(WIFI_AUTO_CNT_FLAG_SET, &reconnect);
		}	
#else
		tls_wifi_auto_connect_flag(WIFI_AUTO_CNT_FLAG_SET, &reconnect);		
#endif	
		//tls_wifi_disconnect();
		tls_netif_add_status_event(wm_ble_netif_status_event);
        status = tls_wifi_connect_by_bssid(p_bssid, p_password, password_length);
		
    }

    if(ssid_length)
    {
        TLS_BT_APPL_TRACE_API("ssid(%d):%s\r\n", ssid_length, p_ssid);
        tls_mem_free(p_ssid);
    }

    if(password_length)
    {
        TLS_BT_APPL_TRACE_API("password(%d):%s\r\n", password_length, p_password);
        tls_mem_free(p_password);
    }

    if(bssid_length)
    {
        TLS_BT_APPL_TRACE_API("bssid(%d):%s\r\n", bssid_length, p_bssid);
        tls_mem_free(p_bssid);
    }

    if(status != 0)
    {
        TLS_BT_APPL_TRACE_WARNING("WIFI connect failed, status=%d\r\n", status);
        build_cmd_rsp(CONFIG_STA_CMD + 0x80, DEFAULT_SEND_FLAG, resp, sizeof(resp));
    }else
    {
#if WIFI_AUTO_RECONNECT_ENABLE
        ble_npl_callout_reset(&g_wifi_reconnect_timer,ble_npl_time_ms_to_ticks32(DISCONNECT_TIME_OUT/2));
#endif
    }

    return status;
}

static int get_ap_list(const uint8_t *payload, int length)
{
}
static int wlan_enter_soft_ap_mode(const uint8_t *payload, int length)
{
}
static int wlan_enter_soft_ap_and_sta_mode(const uint8_t *payload, int length)
{
}

static int app_cmd_process(uint8_t *ptr, int length)
{
    //hci_dbg_hexstring("Process cmd\r\n", ptr, length);

    /* ptr = opcode + payload */
    switch(ptr[0])
    {
        case CONFIG_STA_CMD:
            wlan_config_process(ptr + 1, length - 1);
            break;

        case CONFIG_SOFTAP_CMD:
            wlan_enter_soft_ap_mode(ptr + 1, length - 1);
            break;

        case CONFIG_STA_SOFTAP_CMD:
            wlan_enter_soft_ap_and_sta_mode(ptr + 1, length - 1);
            break;

        case CONFIG_WIFI_SCAN_CMD:
            get_ap_list(ptr + 1, length - 1);
            break;

        case CONFIG_KEY_EXCHANGE_CMD:
            key_exchange_process(ptr + 1, length - 1);
            break;

        default:
            break;
    }

    return 0;
}


static int wm_ble_wifi_cfg_enabled_cb(int status)
{
    TLS_BT_APPL_TRACE_DEBUG("wm_ble_wifi_cfg_enabled_cb:%s\r\n", status==0?"enabled":"disabled");
	if(status == 0)
	{
        /*It is not a proper way to call enable adv here, we must wait other services added if there is*/
		g_bt_wifi_service_enabled = 1;
	}else if(status == 1)
	{
		tls_ble_wifi_adv(false);
		g_bt_wifi_service_enabled = 0;

		/*Fixed, the connection keeps, but the service is deregister already, even worse, the blurdroid does not
		* notify the connection disconnect. so, I FIXED IT here, workaround*/
		if(g_fd&0x01)
		{
			TLS_BT_APPL_TRACE_WARNING("Try to fixed abnormal mode\r\n");	
			tls_ble_wifi_prof_disconnect(1);
		}
	}else
	{
	    /*It means the host is shutdowning*/
	    g_bt_wifi_service_enabled = 0;
		TLS_BT_APPL_TRACE_WARNING("wm_ble_wifi_cfg_enabled_cb, status=%d\r\n", status);
	}
    return 0;
}
static int wm_ble_wifi_cfg_connected_cb(int status)
{
    send_sequence = 0;
    recv_sequence = 0;
    cmd_buffer.pending = false;
    g_sending_pending = false;
   // TLS_BT_APPL_TRACE_DEBUG("ble wifi config service connected start\r\n");    
    rsp_list = tls_mem_alloc(sizeof(struct dl_list));
	if(rsp_list == NULL)
	{
		return BLE_HS_ENOMEM;
	}
    dl_list_init(rsp_list);
    ble_npl_callout_init(&g_rsend_timer, nimble_port_get_dflt_eventq(), send_app_msg_wait_ack_timeout_cb, NULL);
    ble_npl_callout_init(&g_wait_netup_timer, nimble_port_get_dflt_eventq(), wm_ble_netup_event_timeout, NULL);
    ble_npl_callout_init(&g_disconnect_timer, nimble_port_get_dflt_eventq(), wm_ble_wifi_cfg_disconnect, NULL);
    ble_npl_callout_init(&g_defer_report_timer, nimble_port_get_dflt_eventq(), wm_ble_wifi_defer_report_network_status, (void*)NULL);

#if WIFI_AUTO_RECONNECT_ENABLE	
    ble_npl_callout_init(&g_wifi_reconnect_timer, nimble_port_get_dflt_eventq(), wm_ble_wifi_connect_timeout_cb, (void*)(NETIF_WIFI_JOIN_FAILED));
#endif
    g_fd = 1;
    g_wifi_config_success = WIFI_CONFIG_IDLE;
    g_wifi_config_re_enable = 0;
    PAYLOAD_FRAGMENT_LENGTH = 15;
    ble_npl_callout_reset(&g_disconnect_timer,ble_npl_time_ms_to_ticks32(DISCONNECT_TIME_OUT));
    
    TLS_BT_APPL_TRACE_DEBUG("ble wifi config service connected end\r\n");
    
    return 0;
}
static void wm_ble_async_wifi_cfg_deinit(void *arg)
{
    (void)arg;
    tls_ble_wifi_cfg_deinit(1); //close the service, it`s work done;
}
static int wm_ble_wifi_cfg_disconnected_cb(int status)
{
    int rc = 0;
	msg_buffer_t *rsp = NULL;
	msg_buffer_t *rsp_next = NULL;
    
    g_fd = 0;
    if(ble_npl_callout_is_active(&g_rsend_timer)) ble_npl_callout_stop(&g_rsend_timer);
    if(ble_npl_callout_is_active(&g_wait_netup_timer)) ble_npl_callout_stop(&g_wait_netup_timer);
    if(ble_npl_callout_is_active(&g_disconnect_timer)) ble_npl_callout_stop(&g_disconnect_timer);
    if(ble_npl_callout_is_active(&g_defer_report_timer)) ble_npl_callout_stop(&g_defer_report_timer);

	ble_npl_callout_deinit(&g_rsend_timer);
    ble_npl_callout_deinit(&g_wait_netup_timer);
    ble_npl_callout_deinit(&g_disconnect_timer);
    ble_npl_callout_deinit(&g_defer_report_timer);

#if WIFI_AUTO_RECONNECT_ENABLE			
	if(ble_npl_callout_is_active(&g_wifi_reconnect_timer)) ble_npl_callout_stop(&g_wifi_reconnect_timer);
    ble_npl_callout_deinit(&g_wifi_reconnect_timer);
#endif

    /*Try to free rsp list if exists*/
	dl_list_for_each_safe(rsp,rsp_next,rsp_list,msg_buffer_t,list)
	{
		dl_list_del(rsp);
		free_rsp_content(rsp);
	}
    if(rsp_list)
    {
    	tls_mem_free(rsp_list);
		rsp_list = NULL;
    }
	
    if(cmd_buffer.buffer)
    {
        tls_mem_free(cmd_buffer.buffer);
		cmd_buffer.buffer = NULL;
    }

    TLS_BT_APPL_TRACE_DEBUG("ble wifi config service disconnected,[%s][%d]\r\n", g_wifi_config_success==WIFI_CONFIG_END_SUCCESS?"SUCCESS":"FAIL",g_wifi_config_success);

    /*Config success, disable advertisement*/
    if(g_wifi_config_success == WIFI_CONFIG_END_SUCCESS)
    {
    	tls_ble_wifi_adv(false);
    	rc = tls_wifi_set_oneshot_flag(0);
        ///close the service now.
        //tls_bt_async_proc_func(wm_ble_async_wifi_cfg_deinit,NULL, 1);
        TLS_BT_APPL_TRACE_DEBUG("tls_ble_wifi_cfg_deinit\r\n");
        rc = tls_ble_wifi_cfg_deinit(1);
        TLS_BT_APPL_TRACE_DEBUG("tls_ble_wifi_cfg_deinit ret=%d\r\n", rc);
    }else
    {
        /*if the termination is not triggered by local host or the config process broken*/
    	if(status != 534 || g_wifi_config_re_enable)
        {
            tls_ble_wifi_adv(true);
            g_wifi_config_re_enable = 0;
        }
    }

    return rc;
}

static int wm_ble_wifi_cfg_read_cb(int offset)
{
    /*Here is a demo read, I send "01234" to app :) */
    return 0;
}
static void wm_ble_async_process_ack(void *arg)
{
   process_received_ack_or_send_cb(1); 
}
static int wm_ble_wifi_cfg_write_cb(int offset, uint8_t *ptr, int length, bool b_prep)
{
    int rc = 0;
    uint8_t resp[3] = {0x81, 0x01, 0x01}; //parameters error response;
    uint8_t opcode = ptr[0];
    uint8_t sequence = ptr[1];
    uint8_t flag = ptr[2];
    uint8_t seqno = ptr[3];
    uint8_t *ptr_bak = NULL;
    //TODO check offset and b_prep ;
    //assert(b_prep == false);
    //assert(offset == 0);   
    if(offset != 0 || b_prep != false)
    {
    	TLS_BT_APPL_TRACE_WARNING("Unsupport prepare write now...\r\n");
    	return BLE_HS_EINVAL;
    }

    if(sequence != recv_sequence)
    {
        TLS_BT_APPL_TRACE_WARNING("Invalid recv sequence...\r\n");
        return BLE_HS_EAPP;
    }

    /*Refresh the discoonect timer*/
    ble_npl_callout_reset(&g_disconnect_timer,ble_npl_time_ms_to_ticks32(DISCONNECT_TIME_OUT));
    /*Update the next sequence...*/
    recv_sequence++;

    if(flag & ACK_FLAG_VALID_BIT)
    {
        /*per protocol, sequence  as ack payload*/
        send_ack(ptr[1]);
    }

    /*check CRC8*/
    if(ptr[length - 1] != get_crc8(ptr, length - 1))
    {
        build_cmd_rsp(opcode + 0x80, DEFAULT_SEND_FLAG, resp, sizeof(resp));
        ///RE ADV; DISCONNECT ;
        tls_ble_wifi_prof_disconnect(0);
        return BLE_HS_EAUTHEN;
    }

    if(opcode == ACK_FROM_APP)
    {
        tls_bt_async_proc_func(wm_ble_async_process_ack,NULL, 10);
        return 0;
    }

    if(seqno == 0)
    {
        if(cmd_buffer.pending)
        {
            TLS_BT_APPL_TRACE_ERROR("!!!!Invalid cmd(opcode=0x%02x)\r\n", opcode);
            return BLE_HS_EBUSY;
        }

        cmd_buffer.buffer = tls_mem_alloc((length - ATTACHED_LENGTH + 1)); // CRC, SEQUENCE, FLAG, AND NO  equals 4 bytes;
        assert(cmd_buffer.buffer != NULL);
        cmd_buffer.buffer[0] = ptr[0];
        memcpy(&cmd_buffer.buffer[1], ptr + ATTACHED_LENGTH - 1, (length - ATTACHED_LENGTH));
        cmd_buffer.total_len = (length - ATTACHED_LENGTH + 1);
        cmd_buffer.offset = 0x00;

        if(flag & MRE_FLAG_VALID_BIT)
        {
            cmd_buffer.pending = true;
        }
        else
        {
            cmd_buffer.pending = false;
        }
    }
    else
    {
        ptr_bak = cmd_buffer.buffer;
        cmd_buffer.buffer = tls_mem_alloc(cmd_buffer.total_len + length - ATTACHED_LENGTH);
        assert(cmd_buffer.buffer != NULL);
        memcpy(cmd_buffer.buffer, ptr_bak, cmd_buffer.total_len);
        memcpy(cmd_buffer.buffer + cmd_buffer.total_len, ptr + ATTACHED_LENGTH - 1, (length - ATTACHED_LENGTH));
        cmd_buffer.total_len += (length - ATTACHED_LENGTH);
        tls_mem_free(ptr_bak);

        if(flag & MRE_FLAG_VALID_BIT)
        {
        }
        else
        {
            //This must be the last fragmented packet;
            cmd_buffer.pending = false;
        }
    }

    if(cmd_buffer.pending == false)
    {
        if(flag & ENC_FLAG_VALID_BIT)
        {
            length = bt_aes_decrypt(priv_key, cmd_buffer.buffer + 1, cmd_buffer.total_len - 1, cmd_buffer.buffer + 1);

            if(length < 0)
            {
                TLS_BT_APPL_TRACE_ERROR("!!!!bt_aes_decrypt failed\r\n");
                return BLE_HS_EINVAL;
            }

            cmd_buffer.total_len = length + 1;
        }
        
        app_cmd_process(cmd_buffer.buffer, cmd_buffer.total_len);
        cmd_buffer.offset = 0;
        cmd_buffer.total_len = 0;
        tls_mem_free(cmd_buffer.buffer);
        cmd_buffer.buffer = 0x00;
    }

    return 0;
}
static int wm_ble_wifi_cfg_sent_cb(int status)
{
    bool ret = false;
    ret = process_received_ack_or_send_cb(0);

    if(ret == false)
    {
        if(g_wifi_config_success == WIFI_CONFIG_END_FAILED || g_wifi_config_success == WIFI_CONFIG_END_SUCCESS)
        {
            //wifi config finished(success or failed), disconnect with app;
            ble_npl_callout_reset(&g_disconnect_timer,ble_npl_time_ms_to_ticks32(DISCONNECT_TIME_OUT/1000));
        }
    }

    return 0;
}

static int wm_ble_wifi_cfg_exec_write_cb(int exec)
{
    return 0;
}

#ifndef min
	#define min(a,b)    (((a) < (b)) ? (a) : (b))
#endif /* min */

static int wm_ble_wifi_cfg_mtu_changed_cb(int mtu)
{
    int proper_mtu;  //per controller data length ext, max 255 payload bytes
    //244+3+8 = 255;
    proper_mtu = min(mtu, 247); //att level mtu;

    proper_mtu -= 3;            //gatt level mtu;
    
    PAYLOAD_FRAGMENT_LENGTH = proper_mtu  -5; //app msg mtu;  5: wifi cfg protocal msg header;    
}

static wm_ble_wifi_prof_callbacks_t wm_ble_wifi_cfg_cb =
{
    sizeof(wm_ble_wifi_prof_callbacks_t),
    wm_ble_wifi_cfg_enabled_cb,
    wm_ble_wifi_cfg_connected_cb,
    wm_ble_wifi_cfg_disconnected_cb,
    wm_ble_wifi_cfg_read_cb,
    wm_ble_wifi_cfg_write_cb,
    wm_ble_wifi_cfg_exec_write_cb,
    wm_ble_wifi_cfg_sent_cb,
    wm_ble_wifi_cfg_mtu_changed_cb,
};

/*
 * EXPORTED FUNCTION DEFINITIONS
 ****************************************************************************************
 */

int tls_ble_wifi_cfg_init()
{

    int rc = 0;
    if(bt_adapter_state == WM_BT_STATE_OFF)
    {
        TLS_BT_APPL_TRACE_ERROR("%s failed rc=%s\r\n", __FUNCTION__, tls_bt_rc_2_str(BLE_HS_EDISABLED));
        return BLE_HS_EDISABLED;
    }
    
    TLS_BT_APPL_TRACE_DEBUG("wm_bt_wifi_cfg_init, service_enabled=%d\r\n", g_bt_wifi_service_enabled);
    
    if(g_bt_wifi_service_enabled == 1)
    {
        return BLE_HS_EALREADY;
    }
    //step 0: reset other services. Note 
    rc = ble_gatts_reset();
    if(rc != 0)
    {
       TLS_BT_APPL_TRACE_ERROR("tls_svc_wifi failed rc=%d\r\n", rc);
       return rc;
    }
    
    //step 1: config/adding  the services
    rc = tls_ble_wifi_prof_init(&wm_ble_wifi_cfg_cb);
	if(rc != 0)
	{
		TLS_BT_APPL_TRACE_ERROR("wm_wifi_prof_init, ret=%d\r\n", rc);
	}else
    {
        /*step 2: start the service*/
        rc = ble_gatts_start();
        assert(rc == 0);
        
        /*step 3: start advertisement*/
        tls_ble_wifi_adv(true);
    }   
    
    return rc;
}

int tls_ble_wifi_cfg_deinit(int reason)
{
	int rc = 0;
    
    if(bt_adapter_state == WM_BT_STATE_OFF)
    {
        TLS_BT_APPL_TRACE_ERROR("%s failed rc=%s\r\n", __FUNCTION__, tls_bt_rc_2_str(BLE_HS_EDISABLED));
        return BLE_HS_EDISABLED;
    }
    
    TLS_BT_APPL_TRACE_DEBUG("wm_bt_wifi_cfg_deinit, reason=%d, service_enabled=%d\r\n", reason,g_bt_wifi_service_enabled);    
    if(g_bt_wifi_service_enabled == 1)
    {
	    rc = tls_ble_wifi_prof_deinit(reason);
		if(rc != 0)
		{
			TLS_BT_APPL_TRACE_WARNING("wm_bt_wifi_cfg_deinit, ret=%d\r\n", rc);
            g_bt_wifi_service_enabled = 0;
		}
    }else
    {
    	TLS_BT_APPL_TRACE_ERROR("wm_bt_wifi_cfg_deinit, service deinited already\r\n");
    	rc = BLE_HS_EALREADY;
    }

    return rc;
}

#endif
