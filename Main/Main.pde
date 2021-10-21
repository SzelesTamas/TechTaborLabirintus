import java.util.Stack;


//changeable variables
int gridSize=100;
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
int mazeScreenW, mazeScreenH;

//VictoryScreen:
int winSize = 72;
PFont winFont;

boolean showSol;
boolean showedSol;

int nextMove = -1;


GameState gameState = GameState.MainMenu;

void settings() {
  size(800, 550);
}

void setup() {
  surface.setLocation(displayWidth / 2 - width/2, displayHeight/2 - height/2);
  gameState = GameState.MainMenu;
  winFont = createFont("Arial", winSize, false);
  //generateMazeData();

  //generate(rowCount-1, columnCount-1);

  //init scenes
  initMainMenu();
  initVictoryScreen();
}

void draw() {
  switch(gameState) {
  case MainMenu:
    drawMainMenu();
    break;
  case Labyrinth:
    if (playerX == columnCount-1 && playerY == rowCount-1) {
      initVictoryScreen();
      gameState = GameState.VictoryScreen;
    }
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
    mousePressedVictoryScreen();
    break;
  default:
    break;
  }
}
