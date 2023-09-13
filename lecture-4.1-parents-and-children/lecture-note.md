# 4.1 Parents and Children in Class

- **Constructor needs to be distinguishable**:
  
  - you can have multiple constructors within a class, but they must have different parameter lists. This is known as constructor overloading.
  
  ```java
  public class MyClass {
      private int value;
  
      // Constructor with no parameters
      public MyClass() {
          value = 0;
      }
  
      // Constructor with one parameter
      public MyClass(int initialValue) {
          value = initialValue;
      }
  }
  ```

- **Cannot define the same methods all over again**:
  
  - a class cannot have multiple methods with the same name and the same parameter list. 
  
  - This is known as method overloading, and it is not allowed based solely on the return type. However, you can overload methods by changing the number or types of parameters.
  
  ```java
  public class MathUtils {
      // Method to calculate the sum of two integers
      public int calculateSum(int a, int b) {
          return a + b;
      }
  
      // Method to calculate the sum of three integers
      public int calculateSum(int a, int b, int c) {
          return a + b + c;
      }
  }
  ```

## Class Inheritance

- Somtimes different classes share the similar properties and functionalities

- Java allows defining child parent relationships between classes

- A child inherits all **fields** and **methods** from the parent class

- `extends` marks a class as the child. After `extends` the name of the parent class follows

```processing
class A {
    float x;
    ...
    void doSomething () {...}
}
//  child     parent
class B extends A {
    // float x;
    ...
    // void doSomething () {...}
}

A a;
B b;

void setup () {
  a = new A();
  b = new B();
  a.doSomething();
  b.doSomething();
}
```

- Basically, we can outsource the properties that classes have in common to a parent class.

- These properties do not have to be declared later in the individual classes because they are inherited.

### Implement Child/Parent concept to PONG Game

```processing
class Element {
    float x;
    float y;
    float dx;
    float dy;
    Element (float x, float y, float dx,
        this.x = x;
        this.y = y;
        this.dx = dx;
        this.dy = dy;
    }
    void move () {
        x = x+dx;
        y = y+dy;
    }
}

class Ball extends Element {
    ...
} 
class Bat extends Element {
    ... 
}
```

### Super Constructor

- In the constructor of a child class, we have to call the `super` constructor.

- It refers to the constructor defined in the parent class
  
  - use this `super` to initialize the parent part of the object

```processing
class Ball extends Element {
    // x, y, dx, dy from Element
    float r;

    Ball (float x, float y, float d) {
        super(x, y, 5, 5); // From Element
        this.r = r;
    }
    ...
} 
```

### Calling Parent Methods

- when calling a method defined in a parent class on a child object, the method defined in the parent class is executed

```processing
class Element {
  ...
    void move () { x = x+1;
    y = y+1;
    }
}

class Ball extends Element {
    ...
}

Ball b;

...

void draw () {
    ...
    b.move(); // -> speed = 1
}
```

### Overwrite Parent Methods in Child Classes

- if a method is called on a child object and the method is defined in both, parent and child classes, the child class method is executed.

```processing
class Element {
    ...
    void move () {...}
}

class Ball extends Element {
    ...
    void move () {
    x = x+8;
    y = y+8;
}

Ball b; 
...

void draw () {
    ...
    b.move(); // -> speed = 8
}
```

### Refering to the Method in Parent Class

- add more code in parent's `move()`

```processing
class Element {
    ...
    void move () {
        ...
    }
}

class Ball extends Element {
    ...
    void move () {
    super.move();
    println("extra code executed");
}

Ball b;
...

void draw () {
    ...
    b.move(); // -> speed = 1
}
```
