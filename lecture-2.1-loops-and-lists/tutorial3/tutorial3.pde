// Draw checkboard
void setup() {
  size(600,600);
}

void draw() {
  background(0);
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      if ((i % 2 == 0 && j % 2 == 0) || (i % 2 == 1 && j % 2 == 1)) {
        fill(255,0,0); } 
      else {
        noFill();
      }
      rect(60*i, 60*j, 60, 60);
    }
  }
}

// // Draw circles independantly
float [] x;
float [] y;
float [] dx;
float [] dy;
int num;
int radius;

void setup() {
  size(600,600);
  num = 100;
  radius = 25;
  x = new float [num];
  y = new float [num];
  dx = new float [num];
  dy = new float [num];
  
  for (int i = 0; i < num; i++) {
    x[i] = random(radius,width-radius);
    y[i] = random(radius,width-radius);
    dx[i] = random(-5,5);
    dy[i] = random(-5,5);
  }
}

void draw() {
  background(0);

  for (int i = 0; i < num; i++) {
    x[i] = x[i] + dx[i];
    y[i] = y[i] + dy[i];

    // Set circles border
    if (x[i] > 600-radius || x[i] <= 0+radius) {
      dx[i] = dx[i] * -1;
    }
    if (y[i] > 600-radius || y[i] <= 0+radius) {
      dy[i] = dy[i] * -1;
    }
    // draw circles
    ellipse(x[i],y[i],radius*2,radius*2);
  }
  
}
