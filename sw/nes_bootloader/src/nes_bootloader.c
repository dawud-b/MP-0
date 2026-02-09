/*****************************************************************************
 * Joseph Zambreno
 * Phillip Jones
 *
 * Department of Electrical and Computer Engineering
 * Iowa State University
 *****************************************************************************/

/*****************************************************************************
 * nes_bootloader.c - main nes_bootloader application code. The bootloader
 * reads a .nes file from the SD card, and uses this information to
 * load and emulate the NES rom.
 *
 *
 * NOTES:
 * 10/25/13 by JAZ::Design created.
 *****************************************************************************/

#include "nes_bootloader.h"
#include "NESCore/NESCore.h"
#include <unistd.h>  // for usleep
#include "screen_io.h"

char exit_game = 0;
void name_from_game_idx(char* str_buf, int game_idx);
int menu();

// Main function. Performs Xilinx-specific initialization, and then goes into the main polling loop
int main() {

	// Initialize all memory space
	xil_init();

	// Initialize the NESCore
	NESCore_Init();


	// Enable the cache
    Xil_DCacheEnable();

    //while (1)
    //xil_printf("GPIO: %d and %d\r\n", Xil_In32(XPAR_AXI_GPIO_0_BASEADDR + 0), Xil_In32(XPAR_AXI_GPIO_0_BASEADDR + 0x8));


	/*xil_printf("HERE");
    XGpioPs_Config *config;
    XGpioPs button;
    config = XGpioPs_LookupConfig(XPAR_PS7_GPIO_0_DEVICE_ID);
    XGpioPs_CfgInitialize(&button, config, config->BaseAddr);
    XGpioPs_SetDirection(&button, 1, 0);

    while (1) {
    	xil_printf("Button stat: %d\r\n", XGpioPs_ReadPin(&button, 51));
    	usleep(100000);
    }

    return;*/
    // Main polling loop. For now, you can hard-code the .nes ROM you would like to load.
    // Later, improve the code to have user-specified entry and exit options

	while (1) {
		nes_load();
	}

}



// Runs the main NES emulation
void nes_load() {

	int32_t result = 0, i;
	uint8_t nes_fname[17];



	//nes_strncpy(nes_fname, "zelda.nes", 10);
	//nes_strncpy(nes_fname, "smario3.nes", 12);
	//nes_strncpy(nes_fname, "mickeyms.nes", 13);
	Xil_DCacheDisable(); // menu and name_from_game_idx both use xilsd
	int game_idx = menu();
	name_from_game_idx(nes_fname, game_idx);


	if (bootstate.debug_level >= 1)
		xil_printf("nes_load(): loading %s\r\n", nes_fname);

	xil_printf("wav baseaddr: %p\r\n", WAV_BASEADDR);

	// Disable the cache so it will play nice with xilsd (needed here)
	//Xil_DCacheDisable();
	result = NESCore_LoadROM(nes_fname);
	if (result != 0) {
		xil_printf("nes_load(): invalid ROM load. Returning\r\n");
	}
	// Enable the cache for performance reasons
    Xil_DCacheEnable();



	result = NESCore_Reset();
	if (result != 0) {
		xil_printf("nes_load(): invalid reset. Returning\r\n");
	}

	if (bootstate.debug_level >= 1)
		xil_printf("nes_load(): beginning emulation of %s\r\n", nes_fname);


	bootstate.nes_playing = 1;
	usleep(100000);
	ptv = 0;

	// Runs the emulator 20 cycles at a time. Currently there is no exit condition.
	do {

		for (i = 0; i < RESET_TIME; i++) {
			NESCore_Cycle();
		}

		if (__builtin_expect(!!(exit_game), 0)) { // mark this as an unlikely path. Don't waste performance on this rare condition
			exit_game = 0;
			break;
		}

	} while (1);


	bootstate.nes_playing = 0;

	for (i = 0; i < WIDTH*HEIGHT; i++)
		bootstate.activeBuffer[i] = 0;

	return;

}



// Initializes bootloader state, the Xilinx peripherals, and the front buffer
void xil_init() {

	XStatus Status = XST_SUCCESS;
	uint32_t i;
	uint16_t *ptr;

	// Setup the bootloader state variables.
	bootstate.nes_playing = 0;
	bootstate.activeBuffer = (uint32_t *)FBUFFER_BASEADDR;


	bootstate.debug_level = 1;

	if (!USE_SNES_CONTROLLER) {
		XGpioPs_Config *config;
    	config = XGpioPs_LookupConfig(XPAR_PS7_GPIO_0_DEVICE_ID);
    	XGpioPs_CfgInitialize(&PSgpio, config, config->BaseAddr);
    	XGpioPs_SetDirection(&PSgpio, 1, 0);


    	// PL GPIO has a default input state so no need to configure button d pad here.
	} else {
		Xil_Out32(XPAR_AXI_GPIO_1_BASEADDR + 0x4, (0 << 2) | (0 << 1) | (1 << 0)); // 0b001 so output output input
		Xil_Out32(XPAR_AXI_GPIO_1_BASEADDR, 0);
	}





	// For now, we disable the DCache as it causes problems with xilsd and vdma
	Xil_DCacheDisable();


	// Initialize the VTC module
	if (bootstate.debug_level >= 1)
		print("xil_init(): Initializing v_tc module\r\n");

	VtcCfgPtr = XVtc_LookupConfig(XPAR_V_TC_0_DEVICE_ID);
	XVtc_CfgInitialize(&Vtc, VtcCfgPtr, VtcCfgPtr->BaseAddress);
	XVtc_EnableGenerator(&Vtc);


	// Initialize the front buffer
	if (bootstate.debug_level >= 1)
		print("xil_init(): Initializing front buffer\r\n");

	// Initialize the framebuffer. We can overwrite the edges with 0s.
	ptr = (uint16_t *)FBUFFER_BASEADDR;
	for (i = 0; i < WIDTH*HEIGHT; i++) {
		ptr[i] = INIT_COLOR;
		if (i % WIDTH == 0)
			ptr[i] = 0;
	}

	// initialize everything as 0, including borders.
	for (i = 0; i < 480*640; i++) {
		ptr[i] = 0;
	}

	// Initialize the back buffer
	if (bootstate.debug_level >= 1)
		print("xil_init(): Initializing back buffer\r\n");

	ptr = (uint16_t *)BBUFFER_BASEADDR;
	for (i = 0; i < WIDTH*HEIGHT; i++) {
		ptr[i] = INIT_COLOR;
		if (i % WIDTH == 0)
			ptr[i] = 0;
	}

	// Initialize the VDMA module
	if (bootstate.debug_level >= 1)
		print("xil_init(): Initializing vdma module\r\n");


    // Set up VDMA config registers. Copy-paste solution from vga_test.c (but note difference in framebuffer start address)
    // Simple function abstraction by Vendor for writing VDMA registers
    // RS set to start and Circular_Park set to circular mode
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_CR_OFFSET,  0b11);  // Read Channel: VDMA MM2S Circular Mode and Start bits set, VDMA MM2S Control
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_HI_FRMBUF_OFFSET, 0);  // Read Channel: VDMA MM2S Reg_Index
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_START_ADDR_OFFSET, bootstate.activeBuffer);  // Read Channel: VDMA MM2S Frame buffer Start Addr 1
    // stride 640 * 2.
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_STRD_FRMDLY_OFFSET, 640*2);  // Read Channel: VDMA MM2S FRM_Delay, and Stride
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_HSIZE_OFFSET, 640*2);  // Read Channel: VDMA MM2S HSIZE
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_VSIZE_OFFSET, 480);  // Read Channel: VDMA MM2S VSIZE  (Note: Also Starts VDMA transaction)

    screen_io_init();

  	return;
}

typedef enum {
	BTNC_GPIO = 1 << 0,
	BTND_GPIO = 1 << 1,
	BTNL_GPIO = 1 << 2,
	BTNR_GPIO = 1 << 3,
	BTNU_GPIO = 1 << 4
} BTN_GPIO;

typedef enum { // bit position
	SNES_PIN_DATA = 0,
	SNES_PIN_LATCH = 1,
	SNES_PIN_CLK = 2
} SNES_PIN;

void name_from_game_idx(char* str_buf, int game_idx) {
	FIL* dbfile = NULL;
	xilsd_fopen(dbfile, "rominfo.db");
	char game_entry[85];
	for (int i = 0; i < game_idx; i++) {
		xilsd_fread(game_entry, 1, 82, dbfile);
	}

	xilsd_fread(game_entry, 1, 82, dbfile);
	xilsd_fclose(dbfile);

	for (int i = 0; i < 85; i++) {
		if (game_entry[i] == ';') {
			str_buf[i] = '.';
			str_buf[i + 1] = 'n';
			str_buf[i + 2] = 'e';
			str_buf[i + 3] = 's';
			str_buf[i + 4] = '\0';
			break;
		}

		str_buf[i] = game_entry[i];
	}

}

int menu() {
	uint16_t* selection_locations[121] = {0};
	FIL* dbfile = NULL;
	xilsd_fopen(dbfile, "rominfo.db");
	char game_entry[85];
	xilsd_fread(game_entry, 1, 82, dbfile);

	for (int i = 0; i < 84; i++) {
		if (game_entry[i] == ';') {
			game_entry[i] = '\0';
		}
	}

	screen_io_clear();

	selection_locations[0] = screen_io_get_char_loc_ptr();
	screen_io_putc('*');
	screen_io_print(game_entry);

	for (int i = 1; i < 121; i++) {
		xilsd_fread(game_entry, 1, 82, dbfile);
		for (int i = 0; i < 84; i++) {
			if (game_entry[i] == ';') {
				game_entry[i] = '\0';
			}
		}
		selection_locations[i] = screen_io_get_char_loc_ptr();
		screen_io_putc('_');
		screen_io_print(game_entry);
	}

	xilsd_fclose(dbfile);
	screen_io_flush();

#if USE_SNES_CONTROLLER == 0
	int r_clicked = 0; // this distinction may be nice for if your spamming left and right together
	int l_clicked = 0;
	int game_index = 0;
	while (1) {
		uint32_t dpad = Xil_In32(XPAR_AXI_GPIO_0_BASEADDR + 0);
		if (r_clicked && !((dpad & BTNR_GPIO))) {
			r_clicked = 0;
		}
		if (l_clicked && !((dpad & BTNL_GPIO))) {
			l_clicked = 0;
		}
		if (dpad & BTNC_GPIO) {
			screen_io_clear();
			screen_io_flush();
			return game_index;
		}

		if ((dpad & BTNR_GPIO) && !r_clicked) {
			screen_io_set_char_loc_ptr(selection_locations[game_index]);
			screen_io_putc('_');
			if (game_index >= 120)
				game_index = 0;
			else
				game_index++;

			screen_io_set_char_loc_ptr(selection_locations[game_index]);
			screen_io_putc('*');
			screen_io_flush();
			r_clicked = 1;
		} else if ((dpad & BTNL_GPIO) && !l_clicked) {
			screen_io_set_char_loc_ptr(selection_locations[game_index]);
			screen_io_putc('_');
			if (game_index == 0)
				game_index = 120;
			else
				game_index--;

			screen_io_set_char_loc_ptr(selection_locations[game_index]);
			screen_io_putc('*');
			screen_io_flush();
			l_clicked = 1;
		}

		usleep(20000); // for debouncing
	}
#else
	int game_index = 0;
	int r_clicked = 0;
	int l_clicked = 0;
	while (1) {
		Xil_Out32(XPAR_AXI_GPIO_1_BASEADDR, 1 << SNES_PIN_LATCH);
		Xil_Out32(XPAR_AXI_GPIO_1_BASEADDR, 0 << SNES_PIN_LATCH);
		int r_just_clicked = 0;
		int l_just_clicked = 0;
		for (int i = 0; i <= 7; i++) {
			uint32_t serial_bit = Xil_In32(XPAR_AXI_GPIO_1_BASEADDR) & 1;
			if (!serial_bit) {
				switch (i) {
				case 2:
					screen_io_clear();
					screen_io_flush();
					return game_index;
				case 6:
					l_just_clicked = 1;
					if (l_clicked)
						break;
					l_clicked = 1;
					screen_io_set_char_loc_ptr(selection_locations[game_index]);
					screen_io_putc('_');
					if (game_index == 0)
						game_index = 120;
					else
						game_index--;

					screen_io_set_char_loc_ptr(selection_locations[game_index]);
					screen_io_putc('*');
					screen_io_flush();
					break;
				case 7:
					r_just_clicked = 1;
					if (r_clicked)
						break;
					r_clicked = 1;
					screen_io_set_char_loc_ptr(selection_locations[game_index]);
					screen_io_putc('_');
					if (game_index >= 120)
						game_index = 0;
					else
						game_index++;

					screen_io_set_char_loc_ptr(selection_locations[game_index]);
					screen_io_putc('*');
					screen_io_flush();
				default:
					break;
				}
			}

			Xil_Out32(XPAR_AXI_GPIO_1_BASEADDR, 1 << SNES_PIN_CLK);
			Xil_Out32(XPAR_AXI_GPIO_1_BASEADDR, 0 << SNES_PIN_CLK);
		}
		if (l_clicked && !l_just_clicked)
			l_clicked = 0;

		if (r_clicked && !r_just_clicked)
			r_clicked = 0;

		usleep(20000);
	}

#endif
	return 0;
}

