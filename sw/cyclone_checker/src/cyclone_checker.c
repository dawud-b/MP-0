/*****************************************************************************
 * Joseph Zambreno
 * Phillip Jones
 * Department of Electrical and Computer Engineering
 * Iowa State University
 *****************************************************************************/

/*****************************************************************************
 * vga_test.c - example VGA out using a v_tc timing controller and vdma
 * module.
 *
 *
 * NOTES:
 * 10/11/13 by JAZ::Design created.
 * 1/15/2018 by PHJ: Update XVtc_Enable, new function that take only one arg
 * 1/16/2018 by PHJ: Upaded to provide students with an option for directly
                     accessing registers via pointers.
 *****************************************************************************/

#include "platform.h"
#include "xparameters.h"
#include "xil_cache.h"
#include "xvtc.h"
#include "xaxivdma.h"
#include <xil_io.h>

#define CARDIN 0xc8103e
#define GOLD 0xf1be48

u16 test_image[480][640] __attribute__((aligned(64)));

int main() {

	printf("%p\r\n", test_image);

	XVtc Vtc;
    XVtc_Config *VtcCfgPtr;

    int i, j;


    // Enable VTC module: Using high-level functions provided by Vendor
    VtcCfgPtr = XVtc_LookupConfig(XPAR_AXI_VDMA_0_DEVICE_ID);
    XVtc_CfgInitialize(&Vtc, VtcCfgPtr, VtcCfgPtr->BaseAddress);
    XVtc_EnableGenerator(&Vtc);

    // Challenge: Can you rewrite the Enable VTC module code by directly accessing
    // the VTC registers using pointers?  (See VTC data sheet, and xparameters.h)

    // VTC_CR[0]   |=  ENABLE_VTC;    // You: Declare VTC_CR and ENABLE_VTC appropriately (before main() )




    // Initialize Test image for VDMA transfer to VGA monitor
    /*for (i = 0; i < 480; i++) {
      for (j = 0; j < 640; j++) {
    	if (j == 0 && i == 0)
    		test_image[i][j] = 0xAFE;
    	else if (j == 0)
    		test_image[i][j] = 0xBEEF;
    	else if (j < 213) {
          test_image[i][j] = 0x000F; // red pixels
        }
        else if(j < 426 ) {
          test_image[i][j] = 0x00F0; // green pixels
        }
        else if (i == 479 && j == 639)
        	test_image[i][j] = 0xBEFE;
        else if (j == 639)
        	test_image[i][j] = 0xBFFF;
        else {
          test_image[i][j] = 0x0F00; // blue pixels
        }
      }

    }*/

   // checkboard
   int offset = 80;
   for (int i = 0; i < 480; i++) {
    	for (int j = 0; j < 640; j++) {

    		if (j < 80)
    			test_image[i][j] = 0;
    		else if (j >= 560) {
    			test_image[i][j] = 0;
    			continue;
    		}

    		if ( (i / 60) % 2 == 0) { // even rows
    			if ((j / 60) % 2 == 0)
    				test_image[i][j + offset] = ((CARDIN & 0xf00000) >> 12) | ((CARDIN & 0xf000) >> 8) | ((CARDIN & 0xf0) >> 4);
    			else
    				test_image[i][j + offset] = ((GOLD & 0xf00000) >> 12) | ((GOLD & 0xf000) >> 8) | ((GOLD & 0xf0) >> 4);
    		} else { // odd rows
    			if ((j / 60) % 2 == 0)
    				test_image[i][j + offset] = ((GOLD & 0xf00000) >> 12) | ((GOLD & 0xf000) >> 8) | ((GOLD & 0xf0) >> 4);
    			else
    				test_image[i][j + offset] = ((CARDIN & 0xf00000) >> 12) | ((CARDIN & 0xf000) >> 8) | ((CARDIN & 0xf0) >> 4);
    		}
    	}
    }

	// Make sure Display information gets flushed from cache to DDR Memory
    Xil_DCacheFlush();  

    // Set up VDMA config registers
	#define CHANGE_ME 0

    // Simple function abstraction by Vendor for writing VDMA registers
    // RS set to start and Circular_Park set to circular mode
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_CR_OFFSET,  0b11);  // Read Channel: VDMA MM2S Circular Mode and Start bits set, VDMA MM2S Control
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_HI_FRMBUF_OFFSET, 0);  // Read Channel: VDMA MM2S Reg_Index
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_START_ADDR_OFFSET, test_image);  // Read Channel: VDMA MM2S Frame buffer Start Addr 1
    // stride 640 * 2.
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_STRD_FRMDLY_OFFSET, 640*2);  // Read Channel: VDMA MM2S FRM_Delay, and Stride
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_HSIZE_OFFSET, 640*2);  // Read Channel: VDMA MM2S HSIZE
    XAxiVdma_WriteReg(XPAR_AXI_VDMA_0_BASEADDR, XAXIVDMA_MM2S_ADDR_OFFSET + XAXIVDMA_VSIZE_OFFSET, 480);  // Read Channel: VDMA MM2S VSIZE  (Note: Also Starts VDMA transaction)


    // Low-level register acess using pointers
    // Alternative approach for configuring VDMA registers: Instead of using the abstracted functions can you configure and start the VDMA using pointers to directly configure VDMA registers
    // YOU: Declare VDMA_MM2S_XXX (before main) and set values "CHANGE_ME" appropriately, before main()

    // VDMA_MM2S_CR[0]             = CHANGE_ME; // Read Channel: VDMA MM2S Circular/Park Mode and enable the channel
    // VDMA_MM2S_REG_INDEX[0]      = CHANGE_ME; // Read Channel: VDMA MM2S Reg_Index
    // VDMA_MM2S_START_ADDRESS1[0] = CHANGE_ME; // Read channel: VDMA MM2S Frame buffer Start Add 1
    // VDMA_MM2S_FRMDLY_STRIDE[0]  = CHANGE_ME; // Read channel: VDMA MM2S FRM_Delay, and Stride
    // VDMA_MM2S_HSIZE[0]          = CHANGE_ME; // Read channel: VDMA MM2S HSIZE
    // VDMA_MM2S_VSIZE[0]          = CHANGE_ME; // Read channel: VDMA MM2S VSIZE  (Note: Also Starts VDMA transaction)

	
	
	print("Here\r\n");
	
	
    ////////////////////////////////////////////////////////////////
    // Xilinx clean up function
    ////////////////////////////////////////////////////////////////
    cleanup_platform();
	
    return 0;
}
