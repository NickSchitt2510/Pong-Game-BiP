# 4.2 Interfaces

- Interfaces define methods that have to be implemented by the classes implementing this interface.

- interfaces specifies the **return type**, the **name**, and the **arguments**, but not the commands that are performed.

- A `class` can implement multiple `interface`s

```processing
interface Doable {
    void doSomething ();
    void doSomethingElse (int x);
}

class A implements Doable {
    ...
    void doSomething() { ... }
    void doSomethingElse(int x) { ... }
}

class Z {
    ...
    void doSomething() { ... }
    void doSomethingElse(int x) { ... }
}
```
