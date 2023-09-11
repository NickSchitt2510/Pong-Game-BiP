# 2.2 Functions

## Void Type Functions

| Type                      | Name   | Arguments                                                        | Body                                    |
| ------------------------- | ------ | ---------------------------------------------------------------- | --------------------------------------- |
| `void`                    | `func` | `(int i, ..)`                                                    | `{...}`                                 |
| function returns no value |        | Set of arguments that is passed to the function during execution | contains the commands that are executed |

```processing
void setup () {...}
void draw () {
    coCircle(33,33,55,10,0,0,73,0,45);
    coCircle(22,77,33,0,14,0,0,14,83);
    coCircle(55,11,22,0,0,73,53,42,0);
}

void coCircle(int x, int y, int d, int sR, int sG, int sB, int fR, int fG, int fB) {
    stroke(sR, sG, sB);
    fill(fR, fG, fB);
    ellipse(x, y, d, d);
}
```

## Return Type Functions

| Type        | Name   | Argument  | Body                                     |
| ----------- | ------ | --------- | ---------------------------------------- |
| `int`       | `func` | `(int i)` | `{return 2*i;}`                          |
| return type |        |           | The last command to execute in the body. |

```processing
int x = theDoubleOf(3);

int theDoubleOf (int n) {
    return n*2;
}
```

```processing
// generate random character
void setup() {
  frameRate(6);
}

void draw() {
  println(randomString(15));
}

char randomCharacter() {
  float r = random(65,90);
  return (char)r;
}

String randomString(int len) {
  String output = "";
  for (int i = 0; i < len; i++) {
    output += randomCharacter();
  }
  return output;
}
```

## KeyPressed / KeyReleased

```processing
// key pressesd & key released
int y;
void setup() {}

void draw() {
  println(y);
}

void keyPressed () {
    if (key == 'a') {
      y = y + 1;
    }
    if (key == 'w') {
      y = y - 1;
    }
}

void keyReleased() {}
```

### Project: make two bars move up and down

```processing
float y1;
float y2;
float d1;
float d2;
int length;

void setup() {
  size(800,600);
  length = 100;
  y1 = 250;
  y2 = 250;
}

void draw() {
  background(0);
  y1 = y1 + d1;
  // out of bound -> reset
  if (y1 < 0) {
    y1 = 0;
  } else if (y1 > height - length) {
    y1 = height - length;
  }

  y2 = y2 + d2;
  if (y2 < 0) {
    y2 = 0;
  } else if (y2 > height - length) {
    y2 = height - length;
  }

  // in case of d is bigger and recorrect order
  rect(50, y1, 20, length);
  rect(width-50, y2, 20, length);
}

void keyReleased() {
  if (key == 'w' || key == 's') {
    d1 = 0;
  } else if (keyCode == UP || keyCode == DOWN) {
    d2 = 0;
  } 
}

void keyPressed() {
  // Left bar control
  if (key == 'w' && y1 > 0) {
    d1 = -10;
  }
  else if (key == 's' && y1 < height - length) {
    d1 = 10;
  }
  // Right bar control
  if (keyCode == UP && y2 > 0) {
    d2 = -10;
  }
  else if (keyCode == DOWN && y2 < width - length) {
    d2 = 10;
  }
}

```
