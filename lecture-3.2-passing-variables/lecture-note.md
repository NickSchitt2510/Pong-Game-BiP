# 3.2 Passing Variables

## Pass by Value / Reference

- **primitive datatypes** (int, float, char, String, etc) are always *passed by value*

- **objects** datatypes are always *passed by reference*

```processing
void setup() {
  A test = new A (10,10);

  changeValue(test);
  println(test.a);
}

void changeValue (A a) {
  a.a = (int)random(100);
  a.b = (int)random(100);
}

class A {
  int a;
  int b;

  A (int a, int b) {
    this.a = a;
    this.b = b;
  }
}
```

## Variables Scope

- Where are Variables valid?
  
  - Check the `{}`


