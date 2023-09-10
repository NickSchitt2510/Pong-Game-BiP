void setup() {
  
}

void draw() {
  int x = add(1, 4);
}

int add (int a, int b) {
  return a + b;
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