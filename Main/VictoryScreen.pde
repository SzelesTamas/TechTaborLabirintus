private ScreenObject newGamebtn;

void drawVictoryScreen() {
  background(255);
  textFont(winFont, winSize);
  fill(0);
  textAlign(CENTER);
  text("Victory", width/2, height/2);
  newGamebtn.drawThis();
}

void keyPressedVictoryScreen() {
}

void initVictoryScreen(){
  surface.setSize(800,550);
  surface.setLocation(displayWidth / 2 - width/2, displayHeight/2 - height/2);
  newGamebtn = new ScreenObject(width/2-50, height/2+10, 100, 100);
  newGamebtn.setDrawFunc(new Runnable() {
    @Override
      public void run() {
      fill(100, 100, 134);
      noStroke();
      rect(newGamebtn.x, newGamebtn.y, newGamebtn.w, newGamebtn.h);
      fill(0, 0, 0);
      triangle(newGamebtn.x+20, newGamebtn.y + 20, newGamebtn.x+20, newGamebtn.y+newGamebtn.h -20, newGamebtn.x+btn.w -20, newGamebtn.y+newGamebtn.h/2);
    }
  }
  );
  newGamebtn.setOnClickFunc(new Runnable() {
    @Override
    public void run() {
      initMainMenu();
      gameState = GameState.MainMenu;
      System.out.println(gameState);
    }
  }
  );
}
void mousePressedVictoryScreen() {
  if (newGamebtn.contains(mouseX, mouseY)) {
    newGamebtn.onClick();
  }
}
