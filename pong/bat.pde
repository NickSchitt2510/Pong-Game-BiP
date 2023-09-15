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

    // left bar
    if (x < width/2) {
      if (x < 0) {
        x = 0;
      }
      if (x > margin * 2 - thickness) {
        x = margin * 2 - thickness;
      }
    // right bar
    } else { 
      if (x > width/2 && x < width - margin * 2) {
        x = width - margin * 2;
      }
      if (x > width - thickness) {
        x = width - thickness;
      }
    }
  }

  void plot() {
    fill(c);
    rect(x, y, h, w);
  }
}