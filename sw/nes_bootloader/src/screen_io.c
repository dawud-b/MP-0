
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

	//uint16_t* ptr = (uint16_t*) FBUFFER_BASEADDR;

	/*for (int i = 0; i < 21; i++) {
		for (int j = 0; j < 13; j++) {
			ptr[i * 640 + j] = font_characters[43][i][j];
		}
	}*/

	//screen_io_print("Hey hello. New line char:\nOk. Now let's make sure it also wraps around correctly when at the end of the line (so a character isn't split)\n\n\nAnd now we are here.");
	//screen_io_flush();
	//screen_io_clear();
	//screen_io_print("stuff");
	//screen_io_print("Ok lets see multiple lines and whatnot in action ok more text more text more text and even more text lets keep going and see how it goes with more text. This is getting interesting lets keep going. Ok, now let's do this:\nYou saw that new line character?");
	//*/
	//screen_io_print(" Here's a few more\nYep.");
	//screen_io_print("\n\n\nMore\n\n\n\n\nMore\n\n\n\n\n\nMore\nMore");

	//Xil_DCacheFlush();


}

void screen_io_putc(char c) {

	if (c == '\n') {
		int current_line = ((int) (char_loc_ptr - (uint16_t*) FBUFFER_BASEADDR)) / 640;
		char_loc_ptr = ((uint16_t*) FBUFFER_BASEADDR) + (current_line + 21) * 640;
		if (current_line + 21 >= 480 - 21)
			char_loc_ptr = FBUFFER_BASEADDR;
		return;
	}

	int font_char_idx = c - ' '; // starts at <SPACE>

	for (int i = 0; i < 21; i++) {
		for (int j = 0; j < 13; j++) {
			char_loc_ptr[i * 640 + j] = ~font_characters[font_char_idx][i][j];
		}
	}

	if ((int) (char_loc_ptr - (uint16_t*) FBUFFER_BASEADDR) % 640 >= 640 - 2*13) { // need to go to new line
		int current_line = ((int) (char_loc_ptr - (uint16_t*) FBUFFER_BASEADDR)) / 640;
		char_loc_ptr = &((uint16_t*) FBUFFER_BASEADDR)[(current_line + 21) * 640];
		if (current_line + 21 >= 480 - 21)
			char_loc_ptr = FBUFFER_BASEADDR;
	} else
		char_loc_ptr += 13;

}

void screen_io_print(char* str) {
	while (*str) {
		screen_io_putc(*str);
		str++;
	}
}

uint16_t* screen_io_get_char_loc_ptr() {
	return char_loc_ptr;
}

void screen_io_set_char_loc_ptr(uint16_t* ptr) {
	char_loc_ptr = ptr;
}

void screen_io_clear() {
	for (int i = 0; i < 480*640; i++)
		((uint16_t*) FBUFFER_BASEADDR)[i] = 0;

	char_loc_ptr = FBUFFER_BASEADDR;
}

void screen_io_flush() {
	Xil_DCacheFlush();
}
