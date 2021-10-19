void drawPlayer(int row, int column){
  int x = column * gridSize + gridSize/2;
  int y = row * gridSize + gridSize/2;
  fill(#00FFF0);
  strokeWeight(2);
  ellipse(x, y, gridSize*playerSize, gridSize*playerSize);
}
