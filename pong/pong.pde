Ball b1;
Bat a1, a2;

// Declare a PFont variable
PFont myFont;
// Scores variable
int s1, s2;

// Bats constant
int len1; // w
int len2; // w
int thickness; // h
int margin; // m

// Ball variables
int r; // radius
int speed;


void setup() {
  size(1000,600);
  // set up for bats
  // length = 120;
  len1 = 140;
  len2 = 140;
  thickness = 20;
  margin = 50;
  r = 10;
  speed = 0;

  myFont = createFont("Courier", 32); // Load the built-in font with size 32
  textFont(myFont); // Set the font for text

  b1 = new Ball(width/2, height*3/4, r);

  // Reset score
  s1 = 0;
  s2 = 0;
  
  a1 = new Bat(margin, height/2, len1, thickness);
  a2 = new Bat(width-margin-thickness, height/2, len2, thickness);
}

void draw() {
  background(0);

  // Console style
  plotMiddleLine();
  plotScores();

  // Object
  b1.handle();
  
  // ball color change every 10 balls after 30 balls
  color newColor = ballColorChange();
  b1.c = newColor;
  changeBallSpeed();;

  // Shrinking bats after 30 total scores when player scores
  int newLen1 = len2 - min(int(s1)/5*10, 100);
  int newLen2 = len1 - min(int(s2)/5*10, 100);
  
  a1.w = newLen1;
  a2.w = newLen2;
  

  a1.handle();
  a2.handle();
}

void changeBallSpeed() {
  if (s1+s2 == 5) {
    speed = 1;
  } else if (s1+s2 == 30) {
    speed = 1;
  } else if (s1+s2 == 35) {
    speed = 1;
  } else {
    speed = 0;
  }

}

color ballColorChange() {
  // Ball color change darler every 5 total scores after player scores when total players' scores reaches 20 
  color newColor = 255;
  if (s1+s2 > 15) {
    newColor = 115;
  }
  if (s1+s2 > 20) {
    newColor = 60;
  }
  if (s1+s2 > 25) {
    newColor = 30;
  }
  return newColor;
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
  else if (key == 's' && a1.y < height - len1) {
    a1.dy = 5;
  }
  else if (key == 'a' && a1.y < height - len1) {
    a1.dx = -5;
  }
  else if (key == 'd' && a1.y < height - len1) {
    a1.dx = 5;
  }

  // Right bar control
  if (keyCode == UP && a2.y > 0) {
    a2.dy = -5;
  }
  else if (keyCode == DOWN && a2.y < width - len2) {
    a2.dy = 5;
  }
}

void keyReleased() {
  if (key == 'w' || key == 's') {
    a1.dy = 0;
  } else if (key == 'a' || key == 'd') {
    a1.dx = 0;
  } else if (keyCode == UP || keyCode == DOWN) {
    a2.dy = 0;
  } 
}
