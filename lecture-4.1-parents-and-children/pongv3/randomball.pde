class randomBall extends Ball {

  randomBall (float x, float y, float r) {
    super(x, y, r);
    // dx = amplitude * sin(angle);
    // dy = amplitude * sin(angle);
  }

  void move() {

    float ranDX = random(-5, 5);
    float ranDY = random(-5, 5);


    x = x + dx;
    y = y + dy;

  }
}