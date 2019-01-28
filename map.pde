
int T_SIZE = 40;    // size in pixels of my square world tiles

int[][] world;    // wait until the setup function to set the size of this
int GRASS = 0;   // int variable constants - each of these is a code we'll check
int STONE = 1;   // to understand what type of terrain we're on
int DIRT = 2;
int WATER = 3;
int FOREST = 4;
// forest, lava, road, building
int NUM_TERRAIN = 5;   // make sure we update this number when we add terrain types
int selRow = 0;
int selCol = 0;
void setup() {
  size(1000, 800);
  world = new int[height / T_SIZE][width / T_SIZE];
  for (int r = 0; r < world.length; r++) {
    for (int c = 0; c < world[r].length; c++) {
      world[r][c] = (int) random(0, NUM_TERRAIN);
      // if NUM_TERRAIN is 4, we'll get a random value from 0-3
      // upper limit is guaranteed never to be the random number we get
    }
  }
}

void draw() {
  drawWorld();
}

void drawWorld() {
  // loop through the world and draw each tile

  for (int r = 0; r < world.length; r++) {
    //                    ^ number of rows
    for (int c = 0; c < world[r].length; c++) {
      //                     ^ number of cols in this row
      // fill based on terrain type
      if (world[r][c] == GRASS) {
        fill(150, 255, 150);   // bright green
      } else if (world[r][c] == STONE) {
        fill(128, 128, 128);    // gray
      } else if (world[r][c] == DIRT) {
        fill(100, 20, 20);
      } else if (world[r][c] == WATER) {
        fill(150, 150, 255);    // light blue
      } else if (world[r][c] == FOREST) {
        fill(0, 100, 0);    // dark green
      } else {
        fill(0);  // fill with black if an unrecognized terrain type
      }

      // draw the terrain as a rectangle in the correct position
      int x = c * T_SIZE;   // x pixel position is bigger if col# is bigger
      int y = r * T_SIZE;
      rect(x, y, T_SIZE, T_SIZE);  // draw the rect in the right position
      // x, y (upper left corner), width, height of rect
    }
  }
}
void keyPressed() {
  if (key == 'w') {
    // == to check what key was pressed, ' ' for single characters
    // move up rows / decrease row number
    selRow--;

    // if we went too high, reset to top row
    if (selRow < 0) {
      selRow = 0;
    }
  }
  if (key == 's') {
    if (selRow < world[0].length - 1) {
      selRow++;
    }
  }
  if (key == 'a') {
    selCol = max(selCol - 1, 0);
  }
  if (key == 'd') {
    selCol = min(selCol + 1, world[0].length - 1);
  }
}
