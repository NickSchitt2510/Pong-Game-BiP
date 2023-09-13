Ball b1;
Bat a1, a2;
PFont myFont; // Declare a PFont variable

int s1, s2;

// Bat constant
int length; // w
int thickness; // h
int margin; // m
// Ball variables
int r; // radius


void setup() {
  size(1000,600);
  // set up for bats
  length = 100;
  thickness = 20;
  margin = 50;
  r = 10;

  myFont = createFont("Courier", 32); // Load the built-in font with size 32
  textFont(myFont); // Set the font for text

  b1 = new Ball(width/2, height*3/4, r);
  b1.c = color(0, 255, 0);

  // Reset score
  s1 = 0;
  s2 = 0;

  a1 = new Bat(margin, height/2, length, thickness);
  // change default color
  a2 = new Bat(width-margin, height/2, length, thickness);
}

void draw() {
  background(0);

  plotMiddleLine();
  plotScores();


  b1.handle();

  a1.handle();
  a2.handle();
}

void plotMiddleLine() {
  for (int i = 0; i < 30; i++) {
    if (i % 2 == 0) {
      fill(255);
    } else {
      fill(0);
    }
    rect(width/2-2.5, 10+20*i, 5, 20);
  }
}

void plotScores() {
  fill(255); // Text color (white)
  text(s1, width/2-10-100, 100);
  text(s2, width/2-10+100-5, 100);
}

void keyPressed() {
  // Left bar control
  if (key == 'w' && a1.y > 0) {
    a1.dy = -5;
  }
  else if (key == 's' && a1.y < height - length) {
    a1.dy = 5;
  }

  // Right bar control
  if (keyCode == UP && a2.y > 0) {
    a2.dy = -5;
  }
  else if (keyCode == DOWN && a2.y < width - length) {
    a2.dy = 5;
  }
}

void keyReleased() {
  if (key == 'w' || key == 's') {
    a1.dy = 0;
  } else if (keyCode == UP || keyCode == DOWN) {
    a2.dy = 0;
  } 
}
