Generation gen; // Current generation
Cell [][] Population; //create a matrix that holds the position data of the whole population

int globalColCount = 16; //Number for cells horisontally 
int singleCellWidth; // width of a single cell measured between edges
float cellEdgeLength; // the length of each of the six edges of a cell
int globalRowCount; // number of cells vertically

PImage daisy[][] = new PImage [5][7]; //create an array that will contain all of the possible life stages of each "house"
/*
 0 = dead
 1 = alive baby (leaf)
 2 = alive teen (sprout)
 3 = alive adult (half open)
 4 = alive elder (fully open)
 */
PImage d00, d01, d02, d03, d04, d05, d06, d12, d13, d22, d23, d32, d33, d42, d43;
PImage deadDefault, aliveDefault;
String t = "The Big Bang has not yet happened... Press spacebar to enter the world"; //kanskje add big bang?



void setup() {
  size (800, 600); //canvas size
  singleCellWidth = round(width/globalColCount);
  println ("The width of each cell is:  " + singleCellWidth);
  cellEdgeLength = singleCellWidth/sqrt(3);
  println ("The length of a cell edge is: " +cellEdgeLength);
  globalRowCount = int(((height/cellEdgeLength-2)/1.5) + 1);
  println ("Number of cell rows: " + globalRowCount);
  Population = new Cell [globalColCount][globalRowCount];
  gen = new Generation();
  //fill in population matrix with position data
  for (int currentRow = 0; currentRow < globalRowCount; currentRow++) {
    for (int currentColumn = 0; currentColumn < globalColCount; currentColumn++) {
       Population [currentColumn][currentRow] = new Cell (currentColumn,currentRow);
    }
  }
    
  //load all images to create different modes
  d00 = loadImage("00.png");
  d01 = loadImage("01.png");
  d02 = loadImage("02.png");
  d04 = loadImage("04.png");
  d05 = loadImage("05.png");
  d06 = loadImage("06.png");
  d12 = loadImage("12.png");
  d13 = loadImage("13.png");
  d22 = loadImage("22.png");
  d23 = loadImage("23.png");
  d32 = loadImage("32.png");
  d33 = loadImage("33.png");
  d42 = loadImage("42.png");
  d43 = loadImage("43.png");
  deadDefault = loadImage("dead.PNG");
  aliveDefault = loadImage("alive.PNG");
}//end function

void draw() {
  background (1, 137, 7);
  gen.showPopulation();
  fill(255);
  textSize(12);
  text (t, 1, height-13);
}


void keyReleased() { //create new generation
  gen.refreshLifeStatus();
  t = "Generation:" + gen.generationNumber;
}
