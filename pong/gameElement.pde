class GameElement {
  float x;
  float y;
  float dx;
  float dy;

  // datatype to store color
  color c;

  // we can just enter default value 0 in childxP
  GameElement(float x, float y, float dx, float dy, color c) {
    // QA for x and y coordination
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.c = c;
  }
  // initialization for bats
  GameElement (float x, float y) {
    this.x = x;
    this.y = y;
    this.dx = 0;
    this.dy = 0;
    this.c = color(255);
  }

  void handle() {
    move();
    reactToBorders();
    plot();
  }

  void move() {
    x = x + dx;
    y = y + dy;
  }

  void reactToBorders() {}

  void plot() {}
}