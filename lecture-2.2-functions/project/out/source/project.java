/* autogenerated by Processing revision 1293 on 2023-09-11 */
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

public class project extends PApplet {

float y1;
float y2;
float d;
int length;

public void setup() {
  /* size commented out by preprocessor */;
  length = 100;
  y1 = 250;
  y2 = 250;
  length = 100;
}

public void draw() {
  background(0);
  keyPressed();
  rect(50, y1, 20, 100);
}

// void keyPressed() {
//   if (key == 'w') {
//     y1 = y1 + d;
//   }
//   else if (key == 's') {
//     y1 = y1 - d;
//   }
// }


  public void settings() { size(600, 600); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "project" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
