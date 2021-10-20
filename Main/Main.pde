import java.util.Stack;


//changeable variables
int gridSize=200;
int rowCount = 3;
int columnCount = 3;
int showSpeed = 1;


//DO NOT CHANGE -- DO NOT CHANGE -- DO NOT CHANGE -- DO NOT CHANGE -- DO NOT CHANGE
//Movement: up, left, down, right
int[] moveX = {0, -1, 0, 1};
int[] moveY = {-1, 0, 1, 0};

//Player:
float playerSize = 0.6;
int playerX = 0;
int playerY = 0;

//LabyrinthMazeThing:
int defaultStroke = 4;
int[][] isWall;
boolean[][] visited;
int[][] prev;
int curX = 0;
int curY = 0;
int nextX = 0;
int nextY = 0;
IntList randDirection;

//VictoryScreen:
int winSize = 72;
PFont winFont;

boolean showSol;
boolean showedSol;

int nextMove = -1;


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

  //init scenes
  initMainMenu();
}

void draw() {
  if (playerX == columnCount-1 && playerY == rowCount-1) {
    gameState = GameState.VictoryScreen;
  }
  switch(gameState) {
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

void keyPressed() {
  switch(gameState) {
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

void mousePressed() {
  switch(gameState) {
  case MainMenu:
    mousePressedMainMenu();
    break;
  case Labyrinth:
    break;
  case VictoryScreen:
    break;
  default:
    break;
  }
}
