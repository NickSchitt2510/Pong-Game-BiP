class Ball {
  // Fields
  float x;
  float y;
  float dx;
  float dy;
  float r; // radius

  // Constructors
  Ball (float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.dx = 5;
    this.dy = 5;
  }

  // Methods
  void plot() {
    ellipse(x, y, r*2, r*2);
  }

  void move() {
    this.x = this.x + this.dx;
    this.y = this.y + this.dy;

    // Border check
    if (x > width-r || x < r) {
      // reset
      x = width/2;
      y = height/2;
    }
    if (y > height-r || y < r) {
      dy = dy * -1;
    }
    
    // Bounce when touching the bat; gap from margin: 50; height of bat: 20
    if (x == margin + thickness + r && y > a1.y && y < a1.y + length) {
      dx = dx * -1;
    }
    if (x == width - margin - r && y > a2.y && y < a2.y + length) {
      dx = dx * -1;
    }
  }
}