
#include "screen_io.h"

#include "xilsd/xilsd.h"
#include "mmap.h"

// font.bmp each character is 13x21 and there are 90 of them
// In ascii order starting from ! to z
// we will add a space character so that it is <SPACE> to z and so there should be 91 characters then

static uint32_t font_buf[91*21*13 * 2]; // *2 incase bmpRead is reading in the metadata or whatnot
static uint32_t (*font_characters)[21][13] = (uint32_t (*)[21][13]) font_buf;

static uint16_t* char_loc_ptr = FBUFFER_BASEADDR;

void screen_io_init() {

	FIL *fp = NULL;

	xilsd_fopen(fp, "font.bmp");

	bmpRead(fp, font_buf + 21*13); // + 1 because font bmp starts at ! but we want our own space

	for (int i = 0; i < 21*13; i++)
		font_buf[i] = ~0; // space character

	xilsd_fclose(fp);

	uint16_t* ptr = (uint16_t*) FBUFFER_BASEADDR;

	for (int i = 0; i < 21; i++) {
		for (int j = 0; j < 13; j++) {
			ptr[i * 640 + j] = font_characters[43][i][j];
		}
	}

	Xil_DCacheFlush();


}

void screen_io_putc(char c) {

	int font_char_idx = c - ' '; // starts at <SPACE>

	for (int i = 0; i < 21; i++) {
		for (int j = 0; j < 13; j++) {
			char_loc_ptr[i * 640 + j] = ~font_characters[font_char_idx][i][j];
		}
	}

}
