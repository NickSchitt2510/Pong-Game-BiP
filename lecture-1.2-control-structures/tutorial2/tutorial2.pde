// x and y cordinate of the ball
float x;
float y;

// distance a and b of the ball moves for x and y
float a;
float b;
float radius;

void setup() {
  size(600, 600);
  x = random(width);
  y = random(height);
  a = 10;
  b = 10;
  radius = 25;
}

void draw() {
  background(0);
  circle(x, y, 2*radius);
  x = x + a;
  y = y + b;

  if (x <= radius || x >= width - radius) {
    // 變號
    a = a * -1;
  }
  if (y <= radius || y >= height - radius) {
    b = b * -1;
  }
  
}

