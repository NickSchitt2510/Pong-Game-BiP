// Task 1 & 2
// int x;

// Task 3
int y;

// Task 4
float radius;

void setup () {
  size(600,600);
  // Task 1
  // x = 100; 

  // Task 2
  // x = 500;

  // Task 3 & 4
  y = 100;
  radius = 100;
}

// Task 1
// void draw () {
//   background(0);
//   x = x+1;
//   circle(x,200,200);
// }

// Task2
// void draw () {
//   background(0);
//   x = x-1;
//   circle(x,200,200);
// }

// Task 3
void draw() {
  background(0);
  y = y+1;
  circle(200,y,100);
}

// Task 4
void draw() {
  background(0);
  radius = 100*random(5);
  y = y+1;
  circle(200,y,radius);
}
