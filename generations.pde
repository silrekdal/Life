class Generation {
  void showC() {
    for (int j = 0; j < Ny; j++) {
      for (int i = 0; i < Nx; i++) {
        if (j%2 == 0) { //even rows stay the same, odd rows are shifted to the right (thin creates the "beehive" pattern)
          pop[i][j].show();
        } else {
          if (i<Nx-1) { //so that there aren't half hexagons on the right side
            pop[i][j].show();
          }//end if
        }//end else
      }//end for2
    }//end for1
  }//end showC
  
  void count() {
    for (int j = 0; j < Ny; j++) { //for1
      for (int i = 0; i < Nx; i++) { //for2
        int n = 0;
        //for all
        if (j-1>=0) { //top
          n += pop[i][j-1].alive;
        }
        if (i-1>=0) { //left
          n += pop[i-1][j].alive;
        }
        if (i+1<Nx) { //bottom
          n += pop[i+1][j].alive;
        }
        if (j+1<Ny) {//right
          n += pop[i][j+1].alive;
        }
        if (j%2 == 0) {
          if (i-1 >= 0 && j-1 >= 0) {//if1: top left
            n += pop[i-1][j-1].alive;
          } //end if1
          if (i-1>=0 && j+1<Ny) {//if2: bottom left
            n += pop[i-1][j+1].alive;
          }//end if2
        } else {
          if (i+1<Nx && j-1>=0) {//if1: top right
            n += pop[i+1][j-1].alive;
          }//end if1
          if (i+1<Nx && j+1<Ny) {//if2: bottom right
            n += pop[i+1][j+1].alive;
          }//end if2
        }//end else
        pop[i][j].ne = n;
      }//end for2
    }//end for1
  }//end count

  void update() {
    for (int j = 0; j < Ny; j++) {//for1
      for (int i = 0; i < Nx; i++) {//for2
        if (pop [i][j].ne > 3) {//if1
          pop[i][j].alive = 0;
        }//end if1
        if (pop [i][j].ne == 3) {//if2
          pop[i][j].alive = 1;
        }//endif2
        if (pop [i][j].ne < 2) {//if3
          pop[i][j].alive = 0;
        }//endif3
      }//end for2
    }//end fo1
    for (int j = 0; j < Ny; j++) {
      for (int i = 0; i < Nx; i++) {
        if (pop [i][j].alive == 0) {//if1
          if (pop [i][j].ne == 0) {//if2
            pop [i][j].flower = d00;
          } else if (pop [i][j].ne == 1) {
            pop [i][j].flower = d01;
          } else if (pop [i][j].ne == 2) {
            pop [i][j].flower = d02;
          } else if (pop [i][j].ne == 4) {
            pop [i][j].flower = d04;
          } else if (pop [i][j].ne == 5) {
            pop [i][j].flower = d05;
          } else if (pop [i][j].ne == 6) {
            pop [i][j].flower = d06;
          }//end if2
          pop [i][j].age = 0;
        }//end if1
        if (pop [i][j].alive == 1) { //if1
          if (pop [i][j].age >= 0 && pop [i][j].age < 5) {//if2
            if (pop [i][j].ne == 2) {//if3
              pop [i][j].flower = d12;
            } else if (pop [i][j].ne == 3) {
              pop [i][j].flower = d13;
            }//end if3
          } else if (pop [i][j].age >= 5 && pop [i][j].age < 10) {//if4
            if (pop [i][j].ne == 2) {
              pop [i][j].flower = d22;
            } else if (pop [i][j].ne == 3) {
              pop [i][j].flower = d23;
            }//end if4
          } else if (pop [i][j].age >= 10 && pop [i][j].age < 15) {//if5
            if (pop [i][j].ne == 2) {
              pop [i][j].flower = d32;
            } else if (pop [i][j].ne == 3) {
              pop [i][j].flower = d33;
            }//end if5
          } else if (pop [i][j].age >= 15) {//if6
            if (pop [i][j].ne == 2) {
              pop [i][j].flower = d42;
            } else if (pop [i][j].ne == 3) {
              pop [i][j].flower = d43;
            }//end if6
          }//end if2
        }//end of if1
      }//end for2
    }//end for1
  }//end update
  void ageup() {
    for (int j = 0; j < Ny; j++) {//for1
      for (int i = 0; i < Nx; i++) {//for2
        if (pop [i][j].alive == 1) {
          pop [i][j].age++;
        }
      }
    }
  }
}//end gen
