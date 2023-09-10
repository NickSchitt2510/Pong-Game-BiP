float y1;
float y2;
float d;
int length;

void setup() {
  size(600,600);
  length = 100;
  y1 = 250;
  y2 = 250;
  length = 100;
}

void draw() {
  background(0);
  keyPressed();
  rect(50, y1, 20, 100);
}

void keyPressed() {
  if (key == 'w') {
    y1 = y1 + d;
  }
  else if (key == 's') {
    y1 = y1 - d;
  }
}
