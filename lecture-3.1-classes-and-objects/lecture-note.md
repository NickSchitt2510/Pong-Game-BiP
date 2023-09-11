# 3.1 Classes and Objects

Functions and Methods are almost the same

## Classes

- the **abstract description** of a data structire and related functionalities

### Components

| Name            | Description                          | Code                                                                                                                             |
| --------------- | ------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------- |
| **Keyword**     | `class`+class name                   | `class Ball {`                                                                                                                   |
| **Fields**      | variables with differenct data tyeps | `   float x;`<br/>`   float y;`<br/>`   float d;`                                                                                |
| **Constructor** | class name + arguments               | `    public Ball (int x, int y, int d) {`<br/>`       this.x = x;`<br/>`       this.y = y;`<br/>`       this.d = d;`<br/>`    }` |
| **Methods**     | functions in class                   | `    void move () {`<br/>`       x = x + 1;`<br/>`       y = y + 1;`<br/>`    }`                                                 |
| End of class    |                                      | `}``                                                                                                                             |

```processing
Ball b;
void setup () {
    size(600,600);
    b = new Ball (235,237,52);
}
void draw () {...}

class Ball {
    float x;
    float y;
    float d;

    Ball (float x, float y, float d) {
        this.x = x;
        this.y = y;
        this.d = d;
    }
    
    void move () {
      x = x+1;
      y = y+1;
    }
}
```

### . operator

- in the code example below, the class is just a `container` for multiple variables

- can be accessed by using `.` operator

```processing
Ball b;
void setup () {
    size(600,600);
    b = new Ball (235,237,52);
}

void draw () {
    b.x = b.x+1;
    b.y = b.y+1;
}
```

### Methods

- comparting to function. It's almost the same but methods are part of the classes

```processing
class Ball {
    // constructors
    float x;
    float y;
    float d;
    ... 
    // methods (fucntions)
    void move () {
       x = x+1;
       y = y+1;
    }
}
```

## Objects

- **instnace** of classes

### this

- `this` referes to the fild of the current object we are working on.

```processing
class Ball {
    float x;
    float y;
    float d;
    Ball (float x, float y, float d) {
    this.x = x;
    this.y = y;
    this.d = d;
    }
    void move () {
        x = x+1;
        y = y+1;
    }
}
```
