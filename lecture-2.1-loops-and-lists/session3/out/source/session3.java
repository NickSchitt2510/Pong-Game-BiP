/* autogenerated by Processing revision 1293 on 2023-09-06 */
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

public class session3 extends PApplet {

float x;
float y;
float s;


public void setup() {
  /* size commented out by preprocessor */;
  frameRate(2);
}

public void draw() {
  background(0);

  for (int i = 0; i < 100; i++) {
    x = random(width);
    y = random(height);
    s = 50;
    rect(x,y,i,i);
    fill(random(255));
  }

}


  public void settings() { size(600, 600); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "session3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
