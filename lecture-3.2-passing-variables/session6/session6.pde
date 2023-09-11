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