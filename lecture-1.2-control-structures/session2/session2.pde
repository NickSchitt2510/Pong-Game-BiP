float x;
int x1;
void setup () {
  size(600,600);
  x = 0; 
}

void draw () { 
  background(0);
  x = x+0.5;
  x1 = x1+1;
  if (x>200) {
    fill(0, 255,0);
  } else {
    fill(255);
  }

  if (x>400) {
    x = 0;
  }

  if (x>200) {
    fill(255,0,0);
  }

  rect(x,200,200,200);
}