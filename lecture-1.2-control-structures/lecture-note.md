# 1.2 Control Strucures

## Colors

### background

```processing
background(0);
background(255);
background(red, green, blue, alpha);
```

### Fill

- Fill next objects red

```processing
fill(255,0,0);
rect(200,200,200,200);
```

### Stroke

- Set outline color of next object to green

```processing
stroke(0,255,0);
rect(200,200,200,200);
```

## How to prevent crossing border?

### If and Else:

- **If** the rectangle moved further than a specific value along the x-axis, it should return.

- **Else** it can move further.

## Boolean Operators

- statements are either `true` or `false`

- binary data-type is called `boolean`

- can be stored in a  **variable** or **result of an operatio**

| compare          | code       |
| ---------------- | ---------- |
| greater than     | `x > 100`  |
| greater or equal | `x >= 100` |
| equal            | `x == 100` |
| smaller or equal | `x <= 100` |
| smaller than     | `x < 100`  |
| unequal          | `x != 100` |

### and &&

```processing
true && true == true;
true && false == false;
false && true == false;
false && false == false
```

### or ||

```processing
true || true == true;
true || false == true;
false || true == true;
false || false == false;
```

### not !

```processing
!true == false;
!false == true;
```

## Bounce and move

### Method 1: Use boolean

```processing
// x and y cordinate of the ball
float x;
float y;

// distance of the ball moves
float distance;
int radius;

// record x direction. Default value: true. AKA to the right.
boolean directionX;
// record y direction. Default value: true. AKA to the top
boolean directionY;

void setup() {
  size(600, 600);
  x = 25;
  y = 100;
  distance = 5;
  radius = 25;
  directionX = true;
  directionY = true;
}

void draw() {
  background(0);
  circle(x, y, 2*radius);

  // x axix: first method
  if (x < radius) {
    directionX = true;
  }
  if (x > 600 - radius) {
    directionX = false;
  }
  if (directionX == true) {
    x = x + distance;
  } else {
    x = x - distance;
  }

  // y-axis: second method
  if (y < radius) {
    directionY = true;
  } 
  if (y > 600 - radius) {
    directionY = false;
  }
  if (directionY == true) {
    y = y + distance;
  } else {
    y = y - distance;
  }
}
```

## Method 2:

```processing
// x and y cordinate of the ball
float x;
float y;

// distance a and b of the ball moves for x and y
float a;
float b;
int radius;

void setup() {
  size(600, 600);
  x = 25;
  y = 100;
  a = 5;
  b = 5;
  radius = 25;
}

void draw() {
  background(0);
  circle(x, y, 2*radius);
  x = x + a;
  y = y + b;

  if (x < radius || x > 600 - radius) {
    // 變號
    a = a * -1;
  }
  if (y < radius || y > 600 - radius) {
    b = b * -1;
  }

}
```
