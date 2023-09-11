# 2.1 Loops and Lists

## Loops

- draw multiple rectangles but this code will be repetitive

- REPETITIVE

```processing
float x;
float y;

void setup() {
  size(600, 600);
  frameRate(1);
}

void draw() {
  background(0);

  x = random(width);
  y = random(height);
  rect(x,y,200,200);

  x = random(width);
  y = random(height);
  rect(x,y,100,100);
  ...
}
```

### for loop

| Name  | Start       | End      | Steps   | Body    |
| ----- | ----------- | -------- | ------- | ------- |
| `for` | `(int i=0;` | `i<100;` | `i=i+1` | `{...}` |

```processing
// Create lots of rectangles
float x;
float y;

void setup() {
  size(600, 600);
  frameRate(2);
}

void draw() {
  background(0);

  for (int i = 0; i < 100; i++) {
    x = random(width);
    y = random(height);
    s = 50;
    rect(x,y,i,i);
    fill(random(255));
  }
}
```

## Characters

`char`: symbols such as letters, numbers, and punctuation marks

```processing
char c1 = 'a';
char c2 = '.';
char c3 = '7';
char c4 = ' ';
```

## Strings

`Strings`: whole words or sentences

`+`: combine `Strings`

```processing
String s1 = "hello";
String s2 = "world";
String s3 = s1 + " " + s2;
```

## Arrays

- arrays can contain objects of a certain type

```processing
// Declare
int [] a;

// Init and assign
void setup () {
    size(600,600);
    a = new int [3];
    a[0] = 357;
    a[1] = 123;
    a[2] = 142;
}

// Read
void draw () {
    background(a[0], a[1], a[2]);
}
```

### Declare

| Datatype | Name | End |
| -------- | ---- | --- |
| `int []` | `a`  | `;` |

### Init

`a = new int [3];`

+ Create a new array that can contain 3 integer values

### Assign

`a[1] = 100;`

- Assign a value to the array entry with index 1.

- First index is always 0.

### Read

`int x = a[0];`

## Processing Value

| Code     | Definition                                                                          |
| -------- | ----------------------------------------------------------------------------------- |
| `width`  | Width of sketch, defined in `size()`                                                |
| `height` | Height of sketch, defined in `size()`                                               |
| `mouseX` | Current mouse pointer position (x) according to the coordinate system in the sketch |
| `mouseY` | Current mouse pointer position (y) according to the coordinate system in the sketch |

## Tutorials

### Draw checkboard

```processing
// Draw checkboard
void setup() {
  size(600,600);
}

void draw() {
  background(0);
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      if ((i % 2 == 0 && j % 2 == 0) || (i % 2 == 1 && j % 2 == 1)) {
        fill(255,0,0); } 
      else {
        noFill();
      }
      rect(60*i, 60*j, 60, 60);
    }
  }
}
```

### Move circles independantly

```processing
float [] x;
float [] y;
float [] dx;
float [] dy;
int num;
int radius;

void setup() {
  size(600,600);
  num = 100;
  radius = 25;
  x = new float [num];
  y = new float [num];
  dx = new float [num];
  dy = new float [num];

  for (int i = 0; i < num; i++) {
    x[i] = random(radius,width-radius);
    y[i] = random(radius,width-radius);
    dx[i] = random(-5,5);
    dy[i] = random(-5,5);
  }
}

void draw() {
  background(0);

  for (int i = 0; i < num; i++) {
    x[i] = x[i] + dx[i];
    y[i] = y[i] + dy[i];

    // Set circles border
    if (x[i] > 600-radius || x[i] <= 0+radius) {
      dx[i] = dx[i] * -1;
    }
    if (y[i] > 600-radius || y[i] <= 0+radius) {
      dy[i] = dy[i] * -1;
    }
    // draw circles
    ellipse(x[i],y[i],radius*2,radius*2);
  }

}
```
