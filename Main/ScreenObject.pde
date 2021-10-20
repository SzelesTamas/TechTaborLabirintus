class ScreenObject{
  int x,y,w,h;
  Runnable drawFunc, onClickFunc;
  ScreenObject(int xIn, int yIn, int wIn, int hIn){
    setData(xIn,yIn,wIn,hIn);
    setDrawFunc(new Runnable() {
      @Override
        public void run() {
        rect(x,y,w,h);
      }
    });
    setOnClickFunc(new Runnable() {
      @Override public void run(){}
    });
  }
  void setData(int x, int y, int w, int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  void setDrawFunc(Runnable r) {
    this.drawFunc = r;
  }
  void setOnClickFunc(Runnable r) {
    this.onClickFunc = r;
  }
  
  void drawThis() {
    drawFunc.run();
  }

  boolean contains(int x, int y) {
    if (x >= this.x && x<= this.x+this.w &&
      y >= this.y && y<= this.y+this.h) {
      return true;
    }
    return false;
  }

  void onClick() {
    this.onClickFunc.run();
  }
}
