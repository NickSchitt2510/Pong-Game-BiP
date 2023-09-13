class Bat extends GameElement {
  float w;
  float h;

  Bat (float x, float y, float w, float h) {
    super(x, y);
    this.w = w;
    this.h = h;
  }

  void reactToBorders() {
    // out of bound -> reset
    if (y < 0) {
      y = 0;
    }
    if (y > height - w) {
      y = height - w;
    }
  }

  void plot() {
    fill(c);
    rect(x, y, h, w);
  }
}