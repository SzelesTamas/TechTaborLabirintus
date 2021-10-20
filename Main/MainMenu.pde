private Button btn;
void drawMainMenu() {
  background(255, 255, 255);
  textFont(winFont, winSize);
  fill(0);
  textAlign(CENTER, TOP);
  text("Labyrinth Game", width/2, 0);
  btn.drawThis();
}

void keyPressedMainMenu() {
  gameState = GameState.Labyrinth;
}

void mousePressedMainMenu() {
  if (btn.contains(mouseX, mouseY)) {
    btn.onClick();
  }
}

void initMainMenu() {
  btn = new Button(width/2-50, height/2-50, 100, 100);
  btn.setDrawFunc(new Runnable() {
    @Override
      public void run() {
      fill(0, 134, 134);
      noStroke();
      rect(btn.x, btn.y, btn.thisWidth, btn.thisHeight);
      fill(0, 0, 0);
      triangle(btn.x+20, btn.y + 20, btn.x+20, btn.y+btn.thisHeight -20, btn.x+btn.thisWidth -20, btn.y+btn.thisHeight/2);
    }
  }
  );
  btn.setOnClickFunc(new Runnable() {
    @Override
      public void run() {
      gameState = GameState.Labyrinth;
    }
  }
  );
}
