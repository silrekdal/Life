static final int PERCENT_LIVE_AT_STARTUP = 60;  // Percentage of initial live cells
static final int GLOBAL_COL_COUNT = 12; //Number for cells horisontally

GenerationClass generation; // A Generation of cells
CellMatrix [][] cells; // Create a matrix that holds the position data of the whole population
ImageSelector imgSelector;
int singleCellWidth; // width of a single cell measured between edges
float cellEdgeLength; // the length of each of the six edges of a cell
int globalRowCount; // number of cells vertically

String t = "The Big Bang has not yet happened... Press spacebar to enter the world"; //kanskje add big bang?

void setup() {

  generation = new GenerationClass();
  imgSelector = new ImageSelector();

  size (800, 800); //canvas size
  singleCellWidth = round(width/(GLOBAL_COL_COUNT+0.5));
  println ("The width of each cell is:  " + singleCellWidth);
  cellEdgeLength = singleCellWidth/sqrt(3);
  println ("The length of a cell edge is: " +cellEdgeLength);
  globalRowCount = int(((height/cellEdgeLength-2)/1.5) + 1);
  println ("Number of cell rows: " + globalRowCount);
  cells = new CellMatrix [GLOBAL_COL_COUNT][globalRowCount];
  //fill in population matrix with position data
  for (int currentRow = 0; currentRow < globalRowCount; currentRow++) {
    for (int currentColumn = 0; currentColumn < GLOBAL_COL_COUNT; currentColumn++) {
      cells [currentColumn][currentRow] = new CellMatrix (currentColumn, currentRow);
    }
  }
  
  generation.updateAllLivingNeighbourCounts(); //<>//
  // The first time we just accept life/death status without updating based on neighbours
  generation.updateAllImages();
  
}//end function

void draw() {
  //background (1, 137, 7);
  background (255, 255, 255); //<>//
  generation.showPopulation();
  fill(255);
  textSize(12);
  text (t, 1, height-13);
}

void keyReleased() { //create new generation
  println( " === New generation =====================" );
  generation.newGeneration();
  t = "Generation:" + generation.generationNumber;
}
