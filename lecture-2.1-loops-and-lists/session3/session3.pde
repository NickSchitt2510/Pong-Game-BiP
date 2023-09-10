// Draw lines
// Integer array to store x position
int mx [];

// Integer array to store y position
int my [];

// Length of line
int len;

void setup() {
  size(600, 600);
  len = 100;
  mx = new int [len];
  my = new int [len];
}

void draw() {
  background(255);

  for (int i = len - 1; i > 0; i--) {
    mx[i] = mx[i-1];
    my[i] = my[i-1];
  }

  // Old version
  // mx[2] = mx[1];
  // my[2] = my[1];

  // mx[1] = mx[0];
  // my[1] = my[0];

  // current position
  mx[0] = mouseX;
  my[0] = mouseY;

  for (int i = 0; i < len - 1; i++) {
    line(mx[i], my[i],mx[i+1],my[i+1]);
  }
  // Old version
  // line(mx[1],my[1],mx[2],my[2]);
  // line(mx[0],my[0],mx[1],my[1]);

}
// End of Draw lines

// Draw rectanlges using loops
// float x;
// float y;
// float s;


// void setup() {
//   size(600, 600);
//   frameRate(2);
// }

// void draw() {
//   background(0);

//   for (int i = 0; i < 100; i++) {
//     x = random(width);
//     y = random(height);
//     s = 50;
//     rect(x,y,i,i);
//     fill(random(255));
//   }

// }
// end of drawing loops