static final int PERCENT_LIVE_AT_STARTUP = 70;  // Percentage of initial live cells //<>// //<>// //<>//
static final int GLOBAL_COL_COUNT = 10; //Number of cells horizontally
static final int GENERATIONS_PER_STAGE = 3; // Number of generations per stage
static final int STAGE_COUNT = 4;
static final int MIN_NEIGHBOURS = 2;
static final int MAX_NEIGHBOURS = 3;
static final int MAX_AGE = GENERATIONS_PER_STAGE * STAGE_COUNT;
boolean keyReleased = false;


Cell[][] cells;

Generation globalGeneration; // A Generation of cells

ImageSelector globalImageSelector;

int cellWidth; // width of a single cell measured between edges
float cellEdgeLength; // the length of each of the six edges of a cell
int globalRowCount; // number of cells vertically


void restartLife()
{
  //fill in population matrix with position data
  for (int currentRow = 0; currentRow < globalRowCount; currentRow++) {
    for (int currentColumn = 0; currentColumn < GLOBAL_COL_COUNT; currentColumn++) {
      cells [currentColumn][currentRow] = new Cell (currentColumn, currentRow);
    }
  }
  globalGeneration.firstGeneration();
}

void setup() {

  size (1200, 800); //canvas size
  cellWidth = round(width/(GLOBAL_COL_COUNT+0.5));
  println ("The width of each cell is:  " + cellWidth);
  cellEdgeLength = cellWidth/sqrt(3);
  println ("The length of a cell edge is: " +cellEdgeLength);
  globalRowCount = int(((height/cellEdgeLength-2)/1.5) + 1);
  println ("Number of cell rows: " + globalRowCount);

  cells = new Cell [GLOBAL_COL_COUNT][globalRowCount];
  globalGeneration = new Generation(); //constructor injection, sends as a parameter the other objects needed
  globalImageSelector = new ImageSelector();
  restartLife();
}//end function

void draw() {
  String textFooter = "RETURN restarts life, ESC stops program.  Any other key adds a generation. Flower dies at age " + MAX_AGE + ", and there are " +GENERATIONS_PER_STAGE + " generations per stage." ;
  background (1, 137, 7);
  globalGeneration.showPopulation();
  fill(255);
  textSize(16);
  if ( globalGeneration.generationNumber > 0 )
  {
    textFooter = "Generation: " + globalGeneration.generationNumber;
  }
  text (textFooter, 20, height-8);
}

void keyPressed()
{
  if ( keyReleased )
  {
    switch( key )
    {
    case RETURN:
      restartLife();
      break;
    case ENTER:
      restartLife();
      break;
    default:
      globalGeneration.newGeneration();
    }
  }
  keyReleased = false;
}

void keyReleased() { 
  keyReleased = true;
}
