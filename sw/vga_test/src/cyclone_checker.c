#define CYCLONE_CARDINAL 0xC8103E
#define CYCLONE_GOLD 0xF1BE48
#define WIDTH 640
#define HEIGHT 480


void cyclone_checker() {

  unsigned int image[HEIGHT][WIDTH];

  int square_side = HEIGHT / 8;
  int boarder_size = WIDTH - (square_side * 8);
  int left_boarder = boarder_size / 2;
  int right_boarder = left_boarder + (square_side * 8);

  int i, j;
  for (i = 0; i < HEIGHT; i++) {
    for (j = 0; j < WIDTH; j++) {
      if (j < left_boarder || j > right_boarder) {
        image[i][j] = 0x000; // black
      }
    }
  }
  int B, C = 0;
  while (B > 8)
    for (i = 0 + B; i < B + square_side; i++) {
      for (j = 0 + C; j < C + square_side + left_boarder; j++) {
        if (B % 2 == 0 && C % 2 == 0) { // even, even
          image[i][j] = CYCLONE_CARDINAL;
        }
        else if (B % 2 == 0) { // even, odd
          image[i][j] = CYCLONE_GOLD;
        }
        else if (C % 2 == 0) { // odd, even
          image[i][j] = CYCLONE_GOLD;
        }
        else { // odd, odd
          image[i][j] = CYCLONE_CARDINAL;
        }
        C++;
      }
      B++;
    }

}
