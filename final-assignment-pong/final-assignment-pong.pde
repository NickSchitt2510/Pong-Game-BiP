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


void setup() {
  size(1000,600);
  myFont = createFont("Courier", 32); // Load the built-in font with size 32
  textFont(myFont); // Set the font for text
  resetGame();
}


void draw() {
  if (!gameEnded) {
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
  } else {
    displayGameResult();
  }
}


void resetGame() {
  b1 = new Ball(width/2, height*3/4, r);
  s1 = 0; // Reset score
  s2 = 0;
  a1 = new Bat(margin, height/2, len1, thickness);
  a2 = new Bat(width-margin-thickness, height/2, len2, thickness);
}


void plotMiddleLine() {
  for (int i = 0; i < 30; i++) {
    fill(i % 2 == 0 ? 255 : 0);
    rect(width/2-2.5, 10+20*i, 5, 20);
  }
}


void plotScores() {
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


void plotLevel() {
  fill(255);
  textSize(16);
  textAlign(LEFT);
  text("Bat Level: " + (bat1Level < 3 ? bat1Level : "MAX"), 40, 40);
  text("Speed Level: " + (speedLevel < 4 ? speedLevel : "MAX"), 40, 60);
  text("Color Level: " + (colorLevel < 3 ? colorLevel : "MAX"), 40, 80);
  textAlign(RIGHT);
  text("Bat Level: " + (bat2Level < 3 ? bat2Level : "MAX"), width - 40, 40);
  text("Speed Level: " + (speedLevel < 4 ? speedLevel : "MAX"), width - 40, 60);
  text("Color Level: " + (colorLevel < 3 ? colorLevel : "MAX"), width - 40, 80);
}


void changeBallColor() {
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


void changeBallSpeed() {
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


void shrinkBats() {
  // Shrink player's bat after player scores every 5 points
  int newLen1 = len2 - min(int(s1) / 5 * 20, 60);
  int newLen2 = len1 - min(int(s2) / 5 * 20, 60);
  a1.w = newLen1;
  a2.w = newLen2;
  bat1Level = (bat1Level < 3 ? int(s1) / 5 : 3);
  bat2Level = (bat1Level < 3 ? int(s2) / 5 : 3);
}


void keyPressed() {
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


void keyReleased() {
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

void displayGameResult() {
  fill(0);
  rect(width/4, height/4, width/2, height/2);
  fill(255);
  textSize(48);
  textAlign(CENTER);
  if(s1 > s2) {
    text("Player 1 Wins!", width / 2, height / 2);
  } else if (s2 > s1) {
    text("Player 2 Wins!", width / 2, height / 2);
  } else {
    text("It's a Tie!", width / 2, height / 2);
  }

}
