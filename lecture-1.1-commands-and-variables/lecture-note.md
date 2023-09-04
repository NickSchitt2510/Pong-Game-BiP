# 1.1 Commands & Variables

## Programming language

- a way to **communicate** with computers

- a tool to help create things

- solves problems

## Two sides of programming language

- easy to read and understand

- easy and fast to process

## Processing

- a java dialect

- shorter instructions than java

- enables us to create visual output with less code

## IDE

- integrated develop environment

## Basic Commands

| Goal                                | Commands                     |
| ----------------------------------- | ---------------------------- |
| draw a rectangle                    | `rect(x, y, width, height);` |
| print "Hello World!"                | `print("Hello World!");`     |
| create a random num between 0 and 1 | `random(1);`                 |
| paint the background black          | `background(0);`             |
| open window with size w, h          | `size(w, h);`                |

### Commands breakdown

| Functionality | Code           |
| ------------- | -------------- |
| command name  | `rect`         |
| arguments     | `(x, y, w, h)` |
| command end   | `;`            |

### Flip Book

`setup()`:

- prepare things once 

```processing
void setup () {
    size(600, 600);
}
```

`draw()`:

- repeat commands until sketch is closed

```processing
void draw() {
    background(10, 100, 255);
    rect(400-50, 200-50, 100, 100);
}
```

- the code runs from top to down

- writing like this. the rectangle won't show

```processing
void draw() {
    rect(400-50, 200-50, 100, 100);
    background(10, 100, 255);
}
```

## Animate / Move

### How to move things?

- Movements are **values changing** over time.

- A method to manipulate the **static** values

## Variables

### Declareation:

- Give values a name

```processing
int x;
```

| Datatype           | Name                        | End |
| ------------------ | --------------------------- | --- |
| `int`              | `x`                         | `;` |
| Types of variables | Always satrt with lowercase |     |

## Initialization:

- Give these cariables initial values

```processing
void setup () {
    size(600,600);
    x = 100;
}
```

## Usage:

- Use variables instead of static values

```processing
void draw () {
    background(0);
    rect(x, 200, 200, 200);
}
```

### How to move then?

- assign new value to variable

```processing
int x;

void setup() {
  size(800, 400);
  x = 100;
}

void draw() {
  background(10, 100, 255);
  x = x + 1;
  rect(x,200-50,100,100);
}
```

# Assigment vs Eqaul Signs

## Programming:

`x = x+1;`

- "x = current value of x + 1"

- solution is saved as the new value of x
