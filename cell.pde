

class Cell {
  private float cx, cy;
  private boolean isAlive;
  int cellColumn;
  int cellRow;
  int age;
  int liveNeighbours; //number of alive neighbors
  PImage flower = d00;

  Cell (int column, int row) {
    cellColumn = column;
    cellRow = row;
    if (evenRow()) { //even rows stay the same, odd rows are shifted to the right (this creates the "beehive" pattern)
      cx = (column+0.5)*singleCellWidth;
      cy = (1+1.5*row)*cellEdgeLength;
    } else {
      cx = (column+1)*singleCellWidth;
      cy = (1+1.5*row)*cellEdgeLength;
    }
    liveNeighbours = 0;
    isAlive = (random(1) < 0.200);
    age = 0;
  }//end definition

  boolean evenRow() {
    return (cellRow %2 ==0);
  }

  int alive() {
    if (isAlive)
      return 1;

    else
      return 0;
  } //end of function

  void updateLife() {
    if (liveNeighbours > 3) {//if1
      isAlive = false;
    }//end if1
    if (liveNeighbours == 3) {//if2
      isAlive = true;
    }//endif2
    if (liveNeighbours < 2) {//if3
      isAlive = false;
    }//endif3
    isAlive = (liveNeighbours == 3);
    if (isAlive)
    {
      age++;
    } else
    {
      age = 0;
    }
  }

  // to cehck if cell is on bottom row and can have neighbours below
  boolean hasNeighboursBelow() {
    return (cellRow > 0);
  }

  boolean hasNeighboursLeft() {
    return (cellColumn > 0);
  }

  boolean hasNeighboursRight() {
    return (cellColumn < horisontalCellCount-1);
  }

  boolean hasNeighboursAbove() {
    return (cellRow < verticalCellCount -1);
  }


  void updateImage() {
    if (isAlive) {
      updateImageAlive();
    } else {
      updateImageDead();
    }
  }

  void updateImageDead() {
    //if1
    switch (liveNeighbours) {
    case 0:
      flower = d00;
    case 1:
      flower = d01;
    case 2:
      flower = d02;
    case 4:
      flower = d04;
    case 5:
      flower = d05;
    case 6:
      flower = d06;
    }
  }



  void updateImageAlive() {

    if (age >= 0 && age < 5) {//if2
      if (liveNeighbours == 2) {//if3
        flower = d12;
      } else if (liveNeighbours == 3) {
        flower = d13;
      }//end if3
    } else if (age >= 5 && age < 10) {//if4
      if (liveNeighbours == 2) {
        flower = d22;
      } else if (liveNeighbours == 3) {
        flower = d23;
      }//end if4
    } else if (age >= 10 && age < 15) {//if5
      if (liveNeighbours == 2) {
        flower = d32;
      } else if (liveNeighbours == 3) {
        flower = d33;
      }//end if5
    } else if (age >= 15) {//if6
      if (liveNeighbours == 2) {
        flower = d42;
      } else if (liveNeighbours == 3) {
        flower = d43;
      }
    }
  }


  void show () {
    imageMode(CENTER);
    if (isAlive) {
      image(d01, cx, cy);
      d01.resize (singleCellWidth, 0);
    } else {
      image(d00, cx, cy);
      d00.resize (singleCellWidth, 0);
    } //end if/else
  }//end function
