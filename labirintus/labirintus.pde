import java.util.Stack;


int gridSize=50;
int rowCount = 10;
int columnCount = 10;
// up, left, down, right
int[] moveX = {0, -1, 0, 1};
int[] moveY = {-1, 0, 1, 0};
int showSpeed = 10;
float playerSize = 0.5;
int defaultStroke = 4;
int winSize = 72;
PFont winFont;

int[][] isWall;
boolean[][] visited;
int[][] prev;
boolean showSol;
boolean showedSol;
int curX = 0;
int curY = 0;
int nextX = 0;
int nextY = 0;
IntList randDirection;
int nextMove = -1;
int playerX = 0;
int playerY = 0;

GameState gameState = GameState.MainMenu;

void settings() {
  int id1 = gridSize*columnCount;
  int id2 = gridSize*rowCount;
  size(id1, id2);
}

void setup() {
  isWall = new int[rowCount][columnCount];
  visited = new boolean[rowCount][columnCount];
  prev = new int[rowCount][columnCount];
  randDirection = new IntList();
  randDirection.append(0);
  randDirection.append(1);
  randDirection.append(2);
  randDirection.append(3);
  showSol = false;
  showedSol = false;
  curX = 0;
  curY = 0;
  nextX = 0;
  nextY = 0;
  nextMove = -1;
  playerX = 0;
  playerY = 0;
  winFont = createFont("Arial", winSize, false);
  
  for (int i = 0; i < rowCount; i++) {
    for (int j = 0; j < columnCount; j++) {

      visited[i][j] = false;
      isWall[i][j] = 15;
      prev[i][j] = -1;
    }
    gameState = GameState.MainMenu;
  }

  generate(rowCount-1, columnCount-1);
}

void draw(){
  if(playerX == columnCount-1 && playerY == rowCount-1){
    gameState = GameState.VictoryScreen;
  }
  switch(gameState){
    case MainMenu:
      drawMainMenu();
      break;
    case Labyrinth:
      drawLabyrinth();
      break;
    case VictoryScreen:
      drawVictoryScreen();
      break;
    default:
      drawMainMenu();
      break;
  }
}

void keyPressed(){
  switch(gameState){
    case MainMenu:
      keyPressedMainMenu();
      break;
    case Labyrinth:
      keyPressLabyrinth();
      break;
    case VictoryScreen:
      break;
    default:
      break;
  } 
}
