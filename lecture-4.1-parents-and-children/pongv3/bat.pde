class Bat {
  float x;
  float y;
  float dy;
  float w;
  float h;
  float m; // margin

  Bat (float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.dy = 0;
  }

  void move() {

    // control bars
    y = y + dy;
    // out of bound -> reset
    if (y < 0) {
      y = 0;
    } else if (y > height - w) {
      y = height - w;
    }
  }

  void plot() {
    rect(x, y, h, w);
  }
}