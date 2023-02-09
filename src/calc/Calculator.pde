 // Johnny Lam | Nov 2022 | Calc project

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0.0";
float l, r, result;
char op = ' ';
boolean left = true;

void setup() {
  size(420, 580);
  numButtons[0] = new Button(60, 210, 80, 60, '7');
  numButtons[1] = new Button(160, 210, 80, 60, '8');
  numButtons[2] = new Button(260, 210, 80, 60, '9');
  numButtons[3] = new Button(60, 290, 80, 60, '4');
  numButtons[4] = new Button(160, 290, 80, 60, '5');
  numButtons[5] = new Button(260, 290, 80, 60, '6');
  numButtons[6] = new Button(60, 370, 80, 60, '1');
  numButtons[7] = new Button(160, 370, 80, 60, '2');
  numButtons[8] = new Button(260, 370, 80, 60, '3');
  numButtons[9] = new Button(60, 450, 80, 60, '0');

  opButtons [0] = new Button(60, 130, 80, 60, ' ');
  opButtons [1] = new Button(160, 130, 80, 60, 'C');
  opButtons [2] = new Button(260, 130, 80, 60, 's');
  opButtons [3] = new Button(360, 130, 80, 60, '√');
  opButtons [4] = new Button(360, 210, 80, 60, '÷');
  opButtons [5] = new Button(360, 290, 80, 60, 'x');
  opButtons [6] = new Button(360, 370, 80, 60, '+');
  opButtons [7] = new Button(360, 450, 80, 60, '-');
  opButtons [8] = new Button(160, 450, 80, 60, '.');
  opButtons [9] = new Button(260, 450, 80, 60, 'c');
  opButtons [10] = new Button(60, 530, 80, 60, '±');
  opButtons [11] = new Button(160, 530, 80, 60, '=');
}

void draw() {
  background(125);
  updateDisplay();
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
}

void keyPressed() {
  println("key:"+key);
  println("keyCode:"+keyCode);
  if (keyCode ==49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 88) {
    handleEvent("x", false);
  } else if (keyCode == 47) {
    handleEvent("/", false);
  } else if (keyCode == 61) {
    handleEvent("=", false);
  }else if (keyCode == 8) {
    handleEvent("c", false);
  }
}

void handleEvent(String val, boolean num) {
  if (num && dVal.length() < 23) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("c")) {
    dVal = "0.0";
    l =0.0;
    r=0.0;
    result=0.0;
    left= true;
    op=' ';
  } else if (val.equals("+")) {
    op = '+';
    left = false;
    dVal = "0.0";
  } else if (val.equals("-")) {
    op = '-';
    left = false;
    dVal = "0.0";
  } else if (val.equals("x")) {
    op = 'x';
    left = false;
    dVal = "0.0";
  } else if (val.equals("/")) {
    op = '/';
    left = false;
    dVal = "0.0";
  } else if (val.equals("=")) {
    performCalculation();
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  }
}
void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on && dVal.length() < 23) {
      handleEvent(str(numButtons[i].val), true);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val=='c') {
      handleEvent("c", false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      handleEvent("-", false);
    } else if (opButtons[i].on && opButtons[i].val == 's') {
      op = opButtons[i].val;
      if (left) {
        l = l * l;
        dVal = str(l);
      } else {
        r = r * r;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 'C') {
      op = opButtons[i].val;
      if (left) {
        l = l * l *l;
        dVal = str(l);
      } else {
        r = r * r * r;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 'x') {
      op = opButtons[i].val;
      left = false;
      dVal = "0.0";
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      op = opButtons[i].val;
      left = false;
      dVal = "0.0";
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left) {
        l = l * -1;
        dVal = str(l);
      } else {
        r = r * -1;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      op = opButtons[i].val;
      if (left) {
        l = sqrt(l);
        dVal =str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    }  else if (opButtons[i].on && opButtons[i].val == ' ') {
      op = opButtons[i].val;
      if (left) {
        l = pow(l,1/3.);
        dVal =str(l);
      } else {
        r = pow(r,1/3.);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    }
    println("L;" + l + "Op" + op + "R:" + r + "Result" + "left" + left);
  }
}

void updateDisplay() {
  rectMode(CENTER);
  rect(width/2, 50, 380, 60, 10);
  fill(255);
  textSize(30);
  textAlign(RIGHT);
  if (dVal.length () <12 ) {
    textSize(60);
  } else if (dVal.length () <15) {
    textSize(50);
  } else if (dVal.length () <19) {
    textSize(40);
  }
  text(dVal, width-40, 60);
}

void performCalculation() {
  if (op== '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'x') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == 's') {
    result = l * l;
    result = r * r;
  } else if (op == '√') {
    result = sqrt(l);
    result = sqrt(r);
  }
  dVal = str(result);
  l = result;
  left = true;
}
