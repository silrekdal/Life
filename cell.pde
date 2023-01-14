class Cell {
  private float cx, cy;
  private boolean isAlive;
  private int liveNeighbours; //number of live neighbors
  int cellColumn;
  int cellRow;
  int age;
  
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
    isAlive = (random(1) < 0.700);
    age = alive();
  }//end constructor

  boolean evenRow() {
    return (cellRow %2 ==0);
  }

  int alive() {
    if (isAlive)
      return 1;

    else
      return 0;
  } //end alive

  void updateLife() {
    
    
    
    isAlive = ((liveNeighbours == 3) || (liveNeighbours == 2 && isAlive));
    
    if (isAlive)
    {
      age++;
    } else
    {
      age = 0;
    }
  } // end updateLife

  // to cehck if cell is on bottom row and can have neighbours below
  boolean hasNeighboursBelow() {
    return (cellRow > 0);
  }

  boolean hasNeighboursLeft() {
    return (cellColumn > 0);
  }

  boolean hasNeighboursRight() {
    return (cellColumn < globalColCount-1);
  }

  boolean hasNeighboursAbove() {
    return (cellRow < globalRowCount -1);
  }

  private void updateImage() {
    if (isAlive) {
      updateImageAlive();
    } else {
      updateImageDead();
    }
  } // end updateImage

  private void updateImageDead() {
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
    default:
      flower = deadDefault;
    }
  } // updateImageDead

  private void updateImageAlive() {
    int stage = age / 2 + 1;
    flower = aliveDefault;
    switch( stage ){
     case 1:
      if (liveNeighbours == 2) {//if3
        flower = d12;
      } else if (liveNeighbours == 3) {
        flower = d13;
      }
    case 2:
      if (liveNeighbours == 2) {
        flower = d22;
      } else if (liveNeighbours == 3) {
        flower = d23;
      }
     case 3:
      if (liveNeighbours == 2) {
        flower = d32;
      } else if (liveNeighbours == 3) {
        flower = d33;
      }
     case 4:
      if (liveNeighbours == 2) {
        flower = d42;
      } else if (liveNeighbours == 3) {
        flower = d43;
      }
    }
  }

  void show () {
    updateImage();
    imageMode(CENTER);
    flower.resize(singleCellWidth, 0 );
    image( flower, cx, cy );
  }//end function 
}
