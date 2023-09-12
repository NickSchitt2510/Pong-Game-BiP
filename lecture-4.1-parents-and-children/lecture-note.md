# 4.1 Parents and Children in Class

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
