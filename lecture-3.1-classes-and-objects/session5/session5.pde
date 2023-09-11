Ball b1;
Ball b2;

void setup() {
  size(600,600);
  b1 = new Ball (500,200,100);
  b2 = new Ball (100,400,50);
}

void draw() {
  background(0);
  // ellipse(b1.x, b1.y, b1.d, b1.d);
  // ellipse(b2.x, b2.y, b2.d, b2.d);
  b1.plot();
  b2.plot();
  b1.move();
  b2.move();
}

class Ball {
  // fields only exisits in the context of ball
  float x;
  float y;
  float d;

  // constructors
  Ball (float x, float y, float d) {
    // clash of name of use this
    this.x = x;
    this.y = y;
    this.d = d;
  }

  // methods
  void plot() {
    ellipse(this.x,this.y,this.d,this.d);
  }

  void move () {
    this.x = this.x + 1;
    this.y = this.y + 1;
  }

  void border() {
    if (this.x > width-this.d) {
      
    }
  }
}


