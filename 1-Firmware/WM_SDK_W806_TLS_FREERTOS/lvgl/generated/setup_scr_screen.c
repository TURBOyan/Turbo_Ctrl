/*
 * Copyright 2021 NXP
 * SPDX-License-Identifier: MIT
 */

#include "lvgl/lvgl.h"
#include <stdio.h>
#include "gui_guider.h"
#include "events_init.h"
#include "custom.h"


void setup_scr_screen(lv_ui *ui){

	//Write codes screen
	ui->screen = lv_obj_create(NULL, NULL);

	//Write codes screen_spinner_1
	ui->screen_spinner_1 = lv_spinner_create(ui->screen, NULL);
	lv_spinner_set_arc_length(ui->screen_spinner_1,60);
	lv_spinner_set_spin_time(ui->screen_spinner_1,1000);
	lv_spinner_set_type(ui->screen_spinner_1,LV_SPINNER_TYPE_SPINNING_ARC);
	lv_spinner_set_dir(ui->screen_spinner_1,LV_SPINNER_DIR_FORWARD);

	//Write style LV_SPINNER_PART_BG for screen_spinner_1
	static lv_style_t style_screen_spinner_1_bg;
	lv_style_init(&style_screen_spinner_1_bg);

	//Write style state: LV_STATE_DEFAULT for style_screen_spinner_1_bg
	lv_style_set_bg_color(&style_screen_spinner_1_bg, LV_STATE_DEFAULT, lv_color_make(0xee, 0xee, 0xf6));
	lv_style_set_bg_grad_color(&style_screen_spinner_1_bg, LV_STATE_DEFAULT, lv_color_make(0xee, 0xee, 0xf6));
	lv_style_set_bg_grad_dir(&style_screen_spinner_1_bg, LV_STATE_DEFAULT, LV_GRAD_DIR_NONE);
	lv_style_set_bg_opa(&style_screen_spinner_1_bg, LV_STATE_DEFAULT, 0);
	lv_style_set_pad_left(&style_screen_spinner_1_bg, LV_STATE_DEFAULT, 5);
	lv_style_set_pad_right(&style_screen_spinner_1_bg, LV_STATE_DEFAULT, 5);
	lv_style_set_pad_top(&style_screen_spinner_1_bg, LV_STATE_DEFAULT, 5);
	lv_style_set_pad_bottom(&style_screen_spinner_1_bg, LV_STATE_DEFAULT, 5);
	lv_style_set_line_color(&style_screen_spinner_1_bg, LV_STATE_DEFAULT, lv_color_make(0xd5, 0xd6, 0xde));
	lv_style_set_line_width(&style_screen_spinner_1_bg, LV_STATE_DEFAULT, 16);
	lv_obj_add_style(ui->screen_spinner_1, LV_SPINNER_PART_BG, &style_screen_spinner_1_bg);

	//Write style LV_SPINNER_PART_INDIC for screen_spinner_1
	static lv_style_t style_screen_spinner_1_indic;
	lv_style_init(&style_screen_spinner_1_indic);

	//Write style state: LV_STATE_DEFAULT for style_screen_spinner_1_indic
	lv_style_set_line_color(&style_screen_spinner_1_indic, LV_STATE_DEFAULT, lv_color_make(0x00, 0xa1, 0xb5));
	lv_style_set_line_width(&style_screen_spinner_1_indic, LV_STATE_DEFAULT, 16);
	lv_obj_add_style(ui->screen_spinner_1, LV_SPINNER_PART_INDIC, &style_screen_spinner_1_indic);
	lv_obj_set_pos(ui->screen_spinner_1, 15, 16);
	lv_obj_set_size(ui->screen_spinner_1, 100, 100);
}