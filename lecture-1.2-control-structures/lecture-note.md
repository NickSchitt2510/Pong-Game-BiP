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
