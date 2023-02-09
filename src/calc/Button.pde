class Button {
  // member variable
  int x, y, w, h;
  color c1, c2, c3;
  char val;
  boolean on;

  //constuctor
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val= val;
    c1= color(255);
    c2 =color(0, 255, 100);
    on = false;
  }
  //member methods
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    strokeWeight(5);
    rect(x, y, w, h);
    textAlign(CENTER);
    fill(0);
    if (val=='c') {
      textSize(20);
      text("Clear", x, y);
    } else if (str(val).contains("s")) {
      textSize(20);
      text( "x\u00B2", x, y);
    } else if (str(val).contains("C")) {
      textSize(20);
      text("x³", x, y);
    }else if (str(val).contains(" ")) {
      textSize(20);
      text("\u00B3\u221Ax", x, y);
    }
    textSize(20);
    text(val,x,y);
  }
  void hover(int mx, int my) {
    on=(mx > x - w/2 && mx < x + w/2 && my > y - h/2 && my < y + h/2);
  }
}
