class Button {
  int thisWidth;
  int thisHeight;
  int x;
  int y;
  Runnable r;
  Runnable onClick;
  Button(int x, int y, int w, int h) {
    this.thisWidth = w;
    this.thisHeight = h;
    this.x = x;
    this.y = y;
  }

  void setData(int x, int y, int w, int h) {
    this.thisWidth = w;
    this.thisHeight = h;
    this.x = x;
    this.y = y;
  }
  void setDrawFunc(Runnable r) {
    this.r = r;
  }
  void setOnClickFunc(Runnable r) {
    this.onClick = r;
  }
  void drawThis() {
    r.run();
  }
  boolean contains(int x, int y) {
    if (x >= this.x && x<= this.x+this.thisWidth &&
      y >= this.y && x<= this.y+this.thisHeight) {
      return true;
    }
    return false;
  }
  void onClick() {
    this.onClick.run();
  }
}
