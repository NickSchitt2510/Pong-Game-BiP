class Bat extends GameElement {
  float w;
  float h;


  Bat (float x, float y, float w, float h) {
    super(x, y);
    this.w = w;
    this.h = h;
  }


  void reactToBorders() {
    // Ensure the bat stays within the vertical bounds
    if (y < 0) {
      y = 0;
    }
    if (y > height - w) {
      y = height - w;
    }

    // Adjust horizontal position based on which bar (left or right)
    if (x < width / 2) { // Left bar
      if (x < 0) {
        x = 0;
      }
      if (x > margin * 2 - thickness) {
        x = margin * 2 - thickness;
      }
    } else { // right bar
      if (x > width / 2 && x < width - margin * 2) {
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