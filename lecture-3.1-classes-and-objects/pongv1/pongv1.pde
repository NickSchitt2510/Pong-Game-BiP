// variables for bats
float y1; // left one
float d1;
float y2; // right one
float d2;
int length;

// variables for balls
float x;
float y;
float dx;
float dy;
int r; // radius

void setup() {
  size(1000,600);
  // set up for bats
  length = 100;
  y1 = 250;
  y2 = 250;
  
  // set up for ball
  r = 10;
  x = 200;
  y = 300;
  dx = 5;
  dy = 5;
}

void draw() {
  background(0);

  // control bars
  y1 = y1 + d1;
  
  // out of bound -> reset
  if (y1 < 0) {
    y1 = 0;
  } else if (y1 > height - length) {
    y1 = height - length;
  }

  y2 = y2 + d2;
  if (y2 < 0) {
    y2 = 0;
  } else if (y2 > height - length) {
    y2 = height - length;
  }

  // in case of d is bigger and recorrect order
  rect(50, y1, 20, length);
  rect(width-50, y2, 20, length);

  // control ball
  x = x + dx;
  y = y + dy;

  // Border check
  if (x > width-r || x < r) {
    // reset
    x = width/2;
    y = height/2;
  }
  if (y > height-r || y < r) {
    dy = dy * -1;
  }
  
  // bounce from the bat
  if (x == 50 + 20 + r && y > y1 && y < y1 + length) {
    dx = dx * -1;
  }
  if (x == width - 50 - r && y > y2 && y < y2 + length) {
    dx = dx * -1;
  }
  
  ellipse(x, y, r*2, r*2);
}

void keyReleased() {
  if (key == 'w' || key == 's') {
    d1 = 0;
  } else if (keyCode == UP || keyCode == DOWN) {
    d2 = 0;
  } 
}

void keyPressed() {
  // Left bar control
  if (key == 'w' && y1 > 0) {
    d1 = -5;
  }
  else if (key == 's' && y1 < height - length) {
    d1 = 5;
  }
  // Right bar control
  if (keyCode == UP && y2 > 0) {
    d2 = -5;
  }
  else if (keyCode == DOWN && y2 < width - length) {
    d2 = 5;
  }
}
