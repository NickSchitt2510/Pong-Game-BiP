Ball b1, b2, b3;
Bat a1, a2;

// Bat constant
int length; // w
int thickness; // h
int margin; // m
// Ball variables
int r; // radius


void setup() {
  size(1000,600);
  // set up for bats
  length = 100;
  thickness = 20;
  margin = 50;
  r = 10;

  b1 = new Ball(width/2, height/2, r);
  b2 = new Ball(width/2, height/4, 2*r);
  b3 = new Ball(width/2, height*3/4, 2.5*r);

  a1 = new Bat(margin, height/2, length, thickness);
  a2 = new Bat(width-margin, height/2, length, thickness);
}

void draw() {
  background(0);

  // Ball
  b1.plot();
  b2.plot();
  b3.plot();
  b1.move();
  b2.move();
  b3.move();

  // Bat
  a1.plot();
  a2.plot();
  a1.move();
  a2.move();
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