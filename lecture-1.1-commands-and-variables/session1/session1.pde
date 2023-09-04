// prepare things once
int x;
void setup() {
  size(800, 400);
  x = 100;
}

// repeat commands until sketch is closed
void draw() {
  background(10, 100, 255);
  x = x + 10;
  rect(x,200-50,100,100);
}