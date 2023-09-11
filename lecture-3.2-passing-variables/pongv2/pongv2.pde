// variables for bats
float y1; // left one
float d1;
float y2; // right one
float d2;
int length;
int thickness;
int margin;

int r; // radius

Ball b1;
Ball b2;
Ball b3;

void setup() {
  size(1000,600);
  // set up for bats
  length = 100;
  thickness = 20;
  y1 = 250;
  y2 = 250;
  
  margin = 50;
  r = 10;

  b1 = new Ball(width/2, height/2, r);
  b2 = new Ball(width/2, height/4, 2*r);
  b3 = new Ball(width/2, height*3/4, 2.5*r);
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
  rect(margin, y1, thickness, length);
  rect(width-margin, y2, thickness, length);

  // control ball
  b1.plot();
  b2.plot();
  b3.plot();
  b1.move();
  b2.move();
  b3.move();
  
}

class Bat {
  float y;
  float d;

  Bat () {
    this.y = width/2;
    // degree the bat move
    this.d = 10;
  }

}

class Ball {
  // Fields
  float x;
  float y;
  float dx;
  float dy;
  float r; // radius

  // Constructors
  Ball (float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.dx = 5;
    this.dy = 5;
  }

  // Methods
  void plot() {
    ellipse(x, y, r*2, r*2);
  }

  void move() {
    this.x = this.x + this.dx;
    this.y = this.y + this.dy;

    // Border check
    if (x > width-r || x < r) {
      // reset
      x = width/2;
      y = height/2;
    }
    if (y > height-r || y < r) {
      dy = dy * -1;
    }
    
    // Bounce when touching the bat; gap from margin: 50; height of bat: 20
    if (x == margin + 20 + r && y > y1 && y < y1 + length) {
      dx = dx * -1;
    }
    if (x == width - margin - r && y > y2 && y < y2 + length) {
      dx = dx * -1;
    }
  }
}


// Control bats with keys
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
