float x;
float y;
float s;


void setup() {
  size(600, 600);
  frameRate(2);
}

void draw() {
  background(0);

  for (int i = 0; i < 100; i++) {
    x = random(width);
    y = random(height);
    s = 50;
    rect(x,y,i,i);
    fill(random(255));
  }

}
