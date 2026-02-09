
#pragma once
#include <stdint.h>


void screen_io_init();

void screen_io_putc(char c);

void screen_io_putc_color(char c, uint16_t RGBcolor);


void screen_io_print(char* str);

void screen_io_clear();

uint16_t* screen_io_get_char_loc_ptr();

void screen_io_set_char_loc_ptr(uint16_t* ptr);

void screen_io_flush();

