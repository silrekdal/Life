class Generation {
  void showPopulation() {
    for (int j = 0; j < Ny; j++) {
      for (int i = 0; i < Nx; i++) {
        if (j%2 == 0) { //even rows stay the same, odd rows are shifted to the right (thin creates the "beehive" pattern)
          Population[i][j].show();
        } else {
          if (i<Nx-1) { //so that there aren't half hexagons on the right side
            Population[i][j].show();
          }//end if
        }//end else
      }//end for2
    }//end for1
  }//end showC
  
  void countLivingNeighbours() {
    for (int y = 0; y < Ny; y++) { //for1
      for (int x = 0; x < Nx; x++) { //for2
        int livingNeighbours = 0;
        //for all
        if (y-1>=0) { //top
          livingNeighbours += Population[x][y-1].isAlive;
        }
        if (x-1>=0) { //left
          livingNeighbours += Population[x-1][y].isAlive;
        }
        if (x+1<Nx) { //bottom
          livingNeighbours += Population[x+1][y].isAlive;
        }
        if (y+1<Ny) {//right
          livingNeighbours += Population[x][y+1].isAlive;
        }
        if (y%2 == 0) {
          if (x-1 >= 0 && y-1 >= 0) {//if1: top left
            livingNeighbours += Population[x-1][y-1].isAlive;
          } //end if1
          if (x-1>=0 && y+1<Ny) {//if2: bottom left
            livingNeighbours += Population[x-1][y+1].isAlive;
          }//end if2
        } else {
          if (x+1<Nx && y-1>=0) {//if1: top right
            livingNeighbours += Population[x+1][y-1].isAlive;
          }//end if1
          if (x+1<Nx && y+1<Ny) {//if2: bottom right
            livingNeighbours += Population[x+1][y+1].isAlive;
          }//end if2
        }//end else
        Population[x][y].liveNeighbours = livingNeighbours;
      }//end for2
    }//end for1
  }//end count

  void updateLifeStatus() {
    for (int y = 0; y < Ny; y++) {//for1
      for (int x = 0; x < Nx; x++) {//for2
        if (Population [x][y].liveNeighbours > 3) {//if1
          Population[x][y].isAlive = 0;
        }//end if1
        if (Population [x][y].liveNeighbours == 3) {//if2
          Population[x][y].isAlive = 1;
        }//endif2
        if (Population [x][y].liveNeighbours < 2) {//if3
          Population[x][y].isAlive = 0;
        }//endif3
      }//end for2
    }//end fo1
    for (int y = 0; y < Ny; y++) {
      for (int x = 0; x < Nx; x++) {
        if (Population [x][y].isAlive == 0) {//if1
          if (Population [x][y].liveNeighbours == 0) {//if2
            Population [x][y].flower = d00;
          } else if (Population [x][y].liveNeighbours == 1) {
            Population [x][y].flower = d01;
          } else if (Population [x][y].liveNeighbours == 2) {
            Population [x][y].flower = d02;
          } else if (Population [x][y].liveNeighbours == 4) {
            Population [x][y].flower = d04;
          } else if (Population [x][y].liveNeighbours == 5) {
            Population [x][y].flower = d05;
          } else if (Population [x][y].liveNeighbours == 6) {
            Population [x][y].flower = d06;
          }//end if2
          Population [x][y].age = 0;
        }//end if1
        if (Population [x][y].isAlive == 1) { //if1
          if (Population [x][y].age >= 0 && Population [x][y].age < 5) {//if2
            if (Population [x][y].liveNeighbours == 2) {//if3
              Population [x][y].flower = d12;
            } else if (Population [x][y].liveNeighbours == 3) {
              Population [x][y].flower = d13;
            }//end if3
          } else if (Population [x][y].age >= 5 && Population [x][y].age < 10) {//if4
            if (Population [x][y].liveNeighbours == 2) {
              Population [x][y].flower = d22;
            } else if (Population [x][y].liveNeighbours == 3) {
              Population [x][y].flower = d23;
            }//end if4
          } else if (Population [x][y].age >= 10 && Population [x][y].age < 15) {//if5
            if (Population [x][y].liveNeighbours == 2) {
              Population [x][y].flower = d32;
            } else if (Population [x][y].liveNeighbours == 3) {
              Population [x][y].flower = d33;
            }//end if5
          } else if (Population [x][y].age >= 15) {//if6
            if (Population [x][y].liveNeighbours == 2) {
              Population [x][y].flower = d42;
            } else if (Population [x][y].liveNeighbours == 3) {
              Population [x][y].flower = d43;
            }//end if6
          }//end if2
        }//end of if1
      }//end for2
    }//end for1
  }//end update
  void incrementAge() {
    for (int y = 0; y < Ny; y++) {//for1
      for (int x = 0; x < Nx; x++) {//for2
        if (Population [x][y].isAlive == 1) {
          Population [x][y].age++;
        }
      }
    }
  }
}//end gen
