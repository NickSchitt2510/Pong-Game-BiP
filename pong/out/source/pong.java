/* autogenerated by Processing revision 1293 on 2023-09-15 */
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

PFont myFont; // Font variable for text

// Scores variables
int s1, s2;

// Variables for levels
int bat1Level = 0;
int bat2Level = 0;
int speedLevel = 0;
int colorLevel = 0;

// Constants for bats
int len1 = 140; // Left bat length
int len2 = 140; // Right bat length
int thickness = 20; // Bat width
int margin = 70; // Margin from edges

// Constants for ball
int r = 10; // Radius
int speed = 0; // speed for fast ball

// Game state variable
boolean gameEnded = false;


public void setup() {
  /* size commented out by preprocessor */;
  myFont = createFont("Courier", 32); // Load the built-in font with size 32
  textFont(myFont); // Set the font for text
  resetGame();
}


public void draw() {
  // Game console style
  background(0);
  plotMiddleLine();
  plotScores();
  plotLevel();

  // Handle objects
  b1.handle();
  changeBallColor();
  changeBallSpeed();
  shrinkBats();
  a1.handle();
  a2.handle();
}


public void resetGame() {
  b1 = new Ball(width/2, height*3/4, r);
  s1 = 0; // Reset score
  s2 = 0;
  a1 = new Bat(margin, height/2, len1, thickness);
  a2 = new Bat(width-margin-thickness, height/2, len2, thickness);
}


public void plotMiddleLine() {
  for (int i = 0; i < 30; i++) {
    fill(i % 2 == 0 ? 255 : 0);
    rect(width/2-2.5f, 10+20*i, 5, 20);
  }
}


public void plotScores() {
  fill(255); // Text color (white)
  textSize(32);
  textAlign(LEFT);
  text(s1, width / 2 - 100, 100);
  textAlign(RIGHT);
  text(s2, width / 2 + 100, 100);
  textSize(24);
  textAlign(CENTER);
  text("Player 1", width / 2 - 100, 50);
  textAlign(CENTER);
  text("Player 2", width / 2 + 100, 50);
}


public void plotLevel() {
  fill(255);
  textSize(16);
  textAlign(LEFT);
  text("Bat Level: " + (bat1Level < 4 ? bat1Level : "MAX"), 40, 40);
  text("Speed Level: " + (speedLevel < 4 ? speedLevel : "MAX"), 40, 60);
  text("Color Level: " + (colorLevel < 3 ? colorLevel : "MAX"), 40, 80);
  textAlign(RIGHT);
  text("Bat Level: " + (bat2Level < 4 ? bat2Level : "MAX"), width - 40, 40);
  text("Speed Level: " + speedLevel, width - 40, 60);
  text("Color Level: " + (colorLevel < 3 ? colorLevel : "MAX"), width - 40, 80);
}


public void changeBallColor() {
  // Ball color darkens every 5 total scores after players' scores reach 15
  if (s1+s2 > 15) {
    colorLevel = 1;
    b1.c = 115;
  }
  if (s1+s2 > 20) {
    colorLevel = 2;
    b1.c = 60;
  }
  if (s1+s2 > 25) {
    colorLevel = 3;
    b1.c = 30;
  }
}


public void changeBallSpeed() {
  // Adjust ball speed based on total scores
  if (s1+s2 == 5) {
    speed = 1;
    speedLevel = 1;
  } else if (s1+s2 == 10) {
    speed = 1;
    speedLevel = 2;
  } else if (s1+s2 == 30) {
    speed = 1;
    speedLevel = 3;
  } else if (s1+s2 == 40) {
    speed = 1;
    speedLevel = 4;
  } else {
    speed = 0;
  }
  
}


public void shrinkBats() {
  // Shrink player's bat after player scores every 5 points
  int newLen1 = len2 - min(PApplet.parseInt(s1) / 5 * 20, 80);
  int newLen2 = len1 - min(PApplet.parseInt(s2) / 5 * 20, 80);
  a1.w = newLen1;
  a2.w = newLen2;
  bat1Level = (bat1Level < 4 ? PApplet.parseInt(s1) / 5 : 4);
  bat2Level = (bat1Level < 4 ? PApplet.parseInt(s2) / 5 : 4);
}


public void keyPressed() {
  // Left bar control
  if (key == 'w' && a1.y > 0) {
    a1.dy = -5;
  }
  else if (key == 's' && a1.y < height - len1) {
    a1.dy = 5;
  }
  else if (key == 'a') {
    a1.dx = -5;
  }
  else if (key == 'd') {
    a1.dx = 5;
  }

  // Right bar control
  if (keyCode == UP && a2.y > 0) {
    a2.dy = -5;
  } else if (keyCode == DOWN && a2.y < width - len2) {
    a2.dy = 5;
  } else if (keyCode == RIGHT) {
    a2.dx = 5;
  } else if (keyCode == LEFT) {
    a2.dx = -5;
  }
}


public void keyReleased() {
  if (key == 'w' || key == 's') {
    a1.dy = 0;
  } else if (key == 'a' || key == 'd') {
    a1.dx = 0;
  } else if (keyCode == UP || keyCode == DOWN) {
    a2.dy = 0;
  } else if (keyCode == LEFT || keyCode == RIGHT) {
    a2.dx = 0;
  } 
}

public void displayGameResult() {
  fill(255);
  textSize(48);
  textAlign(CENTER);

  // if(s1 > s2) {

  // }
}
class Ball extends GameElement {
  // Fields
  float r; // radius

  // Constructors
  Ball (float x, float y, float r) {
    super(x, y, 4, 4, color(255));
    this.r = r;
  }


  // Methods
  public void plot() {
    fill(c);
    ellipse(x, y, r*2, r*2);
  }


  public void reactToBorders() {
    int randomValue = (random(2) > 1 ? 1 : -1);

    // Border check
    if (x > width) {
      resetBall(randomValue);
      resetLevel();
    }
    if (x < 0 - r) {
      resetBall(randomValue);
      resetLevel();
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


  // Reset the ball's position and scores
  public void resetBall(int randomValue) {
    x = width / 2;
    y = height / 2;
    s1 = 0;
    s2 = 0;
    dx = 4 * randomValue * -1;
    dy = 4 * randomValue;
    c = 255;
  }

  // Reset level
  public void resetLevel() {
    bat1Level = 0;
    bat2Level = 0;
    speedLevel = 0;
    colorLevel = 0;
  }


  // Check if the ball touches a bat
  public boolean ballTouchesBat(float left, float right, float top, float bottom) {
    return x >= left && x <= right && y > top && y < bottom;
  }


  // Adjust the ball's direction with speed
  public void adjustBallDirection(float speed) {
    dx = (dx > 0) ? -(dx + speed) : -(dx - speed);
    dy = (dy > 0) ? (dy + speed) : (dy - speed);
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
  int c;


  // we can just enter default value 0 in childxP
  GameElement(float x, float y, float dx, float dy, int c) {
    // QA for x and y coordination
    this.x = x;
    this.y = y;
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
