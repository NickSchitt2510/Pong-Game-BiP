/* autogenerated by Processing revision 1293 on 2023-09-13 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class pong extends PApplet {

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


public void setup() {
  /* size commented out by preprocessor */;
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

public void draw() {
  background(0);

  plotMiddleLine();
  plotScores();


  b1.handle();

  a1.handle();
  a2.handle();
}

public void plotMiddleLine() {
  for (int i = 0; i < 30; i++) {
    if (i % 2 == 0) {
      fill(255);
    } else {
      fill(0);
    }
    rect(width/2-2.5f, 10+20*i, 5, 20);
  }
}

public void plotScores() {
  fill(255); // Text color (white)
  text(s1, width/2-10-100, 100);
  text(s2, width/2-10+100-5, 100);
}

public void keyPressed() {
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

public void keyReleased() {
  if (key == 'w' || key == 's') {
    a1.dy = 0;
  } else if (keyCode == UP || keyCode == DOWN) {
    a2.dy = 0;
  } 
}
class Ball extends GameElement {
  // Fields
  float r; // radius

  // Constructors
  Ball (float x, float y, float r) {
    super(x, y, 5, 5, color(255));
    this.r = r;
  }

  // Methods
  public void plot() {
    fill(c);
    ellipse(x, y, r*2, r*2);
  }

  public void reactToBorders() {
    // Border check
    if (x > width-r) {
      // reset
      x = width/2;
      y = height/2;
      s1 += 1;
    }
    if (x < r) {
      // reset
      x = width/2;
      y = height/2;
      s2 += 1;
    }
    if (y > height-r || y < r) {
      dy = dy * -1;
    }
    
    // Bounce when touching the bat; gap from margin: 50; height of bat: 20
    if (x == margin + thickness + r && y > a1.y && y < a1.y + length) {
      dx = dx * -1;
      s1 += 1;
    }
    if (x == width - margin - r && y > a2.y && y < a2.y + length) {
      dx = dx * -1;
      s2 += 1;
    }
  }
}
class Bat extends GameElement {
  float w;
  float h;

  Bat (float x, float y, float w, float h) {
    super(x, y);
    this.w = w;
    this.h = h;
  }

  public void reactToBorders() {
    // out of bound -> reset
    if (y < 0) {
      y = 0;
    }
    if (y > height - w) {
      y = height - w;
    }
  }

  public void plot() {
    fill(c);
    rect(x, y, h, w);
  }
}
class GameElement {
  float x;
  float y;
  float dx;
  float dy;

  // datatype to store color
  int c;

  // we can just enter default value 0 in childxP
  GameElement(float x, float y, float dx, float dy, int c) {
    // QA for x and y coordination
    if (x > width) {
      this.x = width - r;
    } else if (x < 0) {
      this.x = r;
    } else {
      this.x = x;
    }

    if (y > height) {
      this.y = height - r;
    } else if (y < 0) {
      this.y = r;
    } else {
      this.y = y;
    }

    this.dx = dx;
    this.dy = dy;
    this.c = c;
  }
  // initialization for bats
  GameElement (float x, float y) {
    this.x = x;
    this.y = y;
    this.dx = 0;
    this.dy = 0;
    this.c = color(255);
  }

  public void handle() {
    move();
    reactToBorders();
    plot();
  }

  public void move() {
    x = x + dx;
    y = y + dy;
  }

  public void reactToBorders() {}

  public void plot() {}
}
class randomBall extends Ball {

  randomBall (float x, float y, float r) {
    super(x, y, r);
    // dx = amplitude * sin(angle);
    // dy = amplitude * sin(angle);
  }

  public void move() {

    float ranDX = random(-5, 5);
    float ranDY = random(-5, 5);


    x = x + dx;
    y = y + dy;

  }
}


  public void settings() { size(1000, 600); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "pong" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
