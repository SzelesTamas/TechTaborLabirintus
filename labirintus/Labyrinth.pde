void drawLab(){}
void keyPressLabyrinth(){
  if(key == 'w'){
    // 0
    nextMove = 0;
  }
  else if(key == 'a'){
    // 1
    nextMove = 1;
  }
  else if(key == 's'){
    // 2
    nextMove = 2;
  }
  else if(key == 'd'){
    // 3
    nextMove = 3;
  }
  else if(key == 'z'){
    showSol = true;
  }
  else if(key == 'h'){
    showedSol = false;
    showSol = false;
    curX = 0;
    curY = 0;
  }
}
void clickLab(){}

void drawLabyrinth(){
  if(showSol){
    if(curX == columnCount-1 && curY == rowCount-1){
      showedSol = true;
      showSol = false;
      curX = 0;
      curY = 0;
    }
    else{
      nextX = curX + moveX[prev[curY][curX]];
      nextY = curY + moveY[prev[curY][curX]];
      strokeWeight(gridSize*0.05);
      line(curX*gridSize+gridSize/2, curY*gridSize+gridSize/2, nextX*gridSize+gridSize/2, nextY*gridSize+gridSize/2);
      curX = nextX;
      curY = nextY;
      drawPlayer(playerY, playerX);
      delay(showSpeed);
    }
    nextMove = -1;
  }
  else{
    drawMaze();
    if(nextMove != -1 && ((1<<nextMove) & isWall[playerY][playerX]) == 0){
      playerX += moveX[nextMove];
      playerY += moveY[nextMove];
      nextMove = -1;
    }
    else{
      nextMove = -1;
    }
    drawPlayer(playerY, playerX);
  }
}

void drawMaze() {
  background(255);
  fill(#00FF0A);
  noStroke();
  rect(0, 0, gridSize, gridSize);
  fill(#FF1A00);
  noStroke();
  rect((columnCount-1)*gridSize, (rowCount-1)*gridSize, gridSize, gridSize);
      
  stroke(0);
  strokeWeight(defaultStroke);
  for (int i = 0; i < rowCount; i++) {
    for (int j = 0; j < columnCount; j++) {
      int startx = j*gridSize;
      int starty = i*gridSize;


      if ((isWall[i][j] & 1) != 0) {
        line(startx, starty, startx+gridSize, starty);
      }
      if ((isWall[i][j] & 2) != 0) {
        line(startx, starty, startx, starty+gridSize);
      }
      if ((isWall[i][j] & 4) != 0) {
        line(startx+gridSize, starty+gridSize, startx, starty+gridSize);
      }
      if ((isWall[i][j] & 8) != 0) {
        line(startx+gridSize, starty+gridSize, startx+gridSize, starty);
      }
    }
  }
  
  if(showedSol){
    curX = 0;
    curY = 0;
    while(curX != columnCount-1 || curY != rowCount-1){
      nextX = curX + moveX[prev[curY][curX]];
      nextY = curY + moveY[prev[curY][curX]];
      strokeWeight(gridSize*0.05);
      line(curX*gridSize+gridSize/2, curY*gridSize+gridSize/2, nextX*gridSize+gridSize/2, nextY*gridSize+gridSize/2);
      curX = nextX;
      curY = nextY;
    }
  }
}

void generate(int row, int column) {
  int newRow;
  int newColumn;
  visited[row][column] = true;
  randDirection.shuffle();
  for (int i = 0; i< 4; i++) {
    int ind = (randDirection.get(i))%4;
    newRow = row + moveY[ind];
    newColumn = column + moveX[ind];

    if (newRow < 0 || newRow >= rowCount || newColumn < 0 || newColumn >= columnCount) {
      continue;
    }
    if (visited[newRow][newColumn]) {
      continue;
    }

    isWall[row][column] &= ~(1 << ind);
    isWall[newRow][newColumn] &=  ~(1 << ((ind+2)%4));

    prev[newRow][newColumn] = (ind+2)%4;
    generate(newRow, newColumn);
  }
}
