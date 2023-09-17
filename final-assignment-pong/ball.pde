class Ball extends GameElement {
  // Fields
  float r; // radius

  // Constructors
  Ball (float x, float y, float r) {
    super(x, y, 4, 4, color(255));
    this.r = r;
  }


  // Methods
  void plot() {
    fill(c);
    ellipse(x, y, r*2, r*2);
  }


  void reactToBorders() {

    // Border check
    if (x > width) {
      gameEnded = true;
    }
    if (x < 0 - r) {
      gameEnded = true;
    }
    if (y > height - r || y < r) {
      dy = dy * -1;
    }
    
    // Bounce when touching the bat
    if (ballTouchesBat(a1.x + thickness + r + dx, a1.x + thickness + r, a1.y, a1.y + len1)) {
      adjustBallDirection(speed);
      s1 += 1;
    }
    if (ballTouchesBat(a2.x - r - dx, a2.x - r, a2.y, a2.y + len2)) {
      adjustBallDirection(speed);
      s2 += 1;
    }
  }


  // Check if the ball touches a bat
  boolean ballTouchesBat(float left, float right, float top, float bottom) {
    return x >= left && x <= right && y > top && y < bottom;
  }


  // Adjust the ball's direction with speed
  void adjustBallDirection(float speed) {
    dx = (dx > 0) ? -(dx + speed) : -(dx - speed);
    dy = (dy > 0) ? (dy + speed) : (dy - speed);
  }
}
