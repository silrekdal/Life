int Nx = 10;
//Nx = 10;
int d;
float s;
int Ny;
cell [][] pop; //create a matrix that holds the position data of the whole population
int cellBuffer [][];
int cells [][];
PImage daisy[][] = new PImage [5][7]; //create an array that will contain all of the possible life stages of each "house"
/*
 0 = dead
 1 = alive baby (leaf)
 2 = alive teen (sprout)
 3 = alive adult (half open)
 4 = alive elder (fully open)
 */
PImage d00, d01, d02, d03, d04, d05, d06, d12, d13, d22, d23, d32, d33, d42, d43;
Generation gen;
String t = "Generation:" + g;


void setup() {
  size (800, 600); //canvas size
  d = round(width/Nx);
  println (d);
  s = d/sqrt(3);
  println (s);
  Ny = int(((height/s-2)/1.5) + 1);
  println (Ny);
  pop = new cell [Nx][Ny];
  gen = new Generation();
  //fill in population matrix with position data
  for (int j = 0; j < Ny; j++) {
    for (int i = 0; i < Nx; i++) {
      if (j%2 == 0) { //even rows stay the same, odd rows are shifted to the right (thin creates the "beehive" pattern)
        pop [i][j] = new cell (((i+0.5)*d), ((1+1.5*j)*s));
      } else {
        pop [i][j] = new cell (((i+1)*d), ((1+1.5*j)*s));
      } //end else
    }//end for1
  }//end for2
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
}//end function

void draw() {
  background (1, 137, 7);
  //gen.count();
  gen.showC();
  fill(255);
  textSize(12);
  text (t, Nx+20, Ny-20);
}

void keyPressed() {
  gen.update();
  gen.ageup();
}
