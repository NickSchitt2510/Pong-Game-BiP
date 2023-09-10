float y1;
float y2;
float d1;
float d2;
int length;

void setup() {
  size(600,600);
  length = 100;
  y1 = 250;
  y2 = 250;
}

void draw() {
  background(0);
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
  rect(600-50, y2, 20, length);
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
    d1 = -10;
  }
  else if (key == 's' && y1 < height - length) {
    d1 = 10;
  }
  // Right bar control
  if (keyCode == UP && y2 > 0) {
    d2 = -10;
  }
  else if (keyCode == DOWN && y2 < width - length) {
    d2 = 10;
  }
}
