Ball b1;
Bat a1, a2;

// Bat constant
int length; // w
int thickness; // h
int margin; // m
// Ball variables
int r; // radius
float angle;
float amplitude;


void setup() {
  size(1000,600);
  // set up for bats
  length = 100;
  thickness = 20;
  margin = 50;
  r = 10;
  angle = 0;
  amplitude = 5;

  b1 = new Ball(width/2, height*3/4, r);
  b1.c = color(0, 255, 0);


  a1 = new Bat(margin, height/2, length, thickness);
  // change default color
  a2 = new Bat(width-margin, height/2, length, thickness);
}

void draw() {
  background(0);

  b1.handle();

  a1.handle();
  a2.handle();
}

void keyPressed() {
  // Left bar control
  if (key == 'w' && a1.y > 0) {
    a1.dy = -5;
  }
  else if (key == 's' && a1.y < height - length) {
    a1.dy = 5;
  }

  // Right bar control
  if (keyCode == UP && a2.y > 0) {
    a2.dy = -5;
  }
  else if (keyCode == DOWN && a2.y < width - length) {
    a2.dy = 5;
  }
}

void keyReleased() {
  if (key == 'w' || key == 's') {
    a1.dy = 0;
  } else if (keyCode == UP || keyCode == DOWN) {
    a2.dy = 0;
  } 
}
