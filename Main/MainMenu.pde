private ScreenObject btn;
private TextInputField tfield;
private String txt;
void drawMainMenu() {
  background(255, 255, 255);
  textFont(winFont, winSize);
  fill(0);
  textAlign(CENTER, TOP);
  text("Labyrinth Game", width/2, 0);
  btn.drawThis();
  tfield.drawThis();
}

void keyPressedMainMenu() {
  tfield.onKeyPressed();
  //gameState = GameState.Labyrinth;
}

void mousePressedMainMenu() {
  tfield.focus = false;
  if (btn.contains(mouseX, mouseY)) {
    btn.onClick();
  }
  if (tfield.contains(mouseX, mouseY)) {
    tfield.onClick();
  }
}

void initMainMenu() {
  surface.setSize(800,550);
  surface.setLocation(displayWidth / 2 - width/2, displayHeight/2 - height/2);
  btn = new ScreenObject(width/2-50, height/2-50, 100, 100);
  tfield = new TextInputField(width/2-50, height/2+80, 100, 50, TextInputFilter.Numbers);
  btn.setDrawFunc(new Runnable() {
    @Override
      public void run() {
      fill(0, 134, 134);
      noStroke();
      rect(btn.x, btn.y, btn.w, btn.h);
      fill(0, 0, 0);
      triangle(btn.x+20, btn.y + 20, btn.x+20, btn.y+btn.h -20, btn.x+btn.w -20, btn.y+btn.h/2);
    }
  }
  );
  btn.setOnClickFunc(new Runnable() {
    @Override
      public void run() {
      
      txt = tfield.getText();
      int s;
      if(txt == null ||txt == ""){
        s = 3;
      }else{
        s = int(txt);
      }
      
      rowCount = s;
      columnCount = s;
      generateMazeData();
      generate(rowCount-1,columnCount-1);
      surface.setSize(rowCount*gridSize,columnCount*gridSize);
      surface.setLocation(displayWidth / 2 - width/2, 20);
      //surface.setSize(800,800);
      
      gameState = GameState.Labyrinth;
    }
  }
  );
}
