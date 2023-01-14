class Generation {

  void showPopulation() {
    for (int j = 0; j < verticalCellCount; j++) {
      for (int i = 0; i < horisontalCellCount; i++) {
        if (j%2 == 0) { //even rows stay the same, odd rows are shifted to the right (thin creates the "beehive" pattern)
          Population[i][j].show();
        } else {
          if (i<horisontalCellCount-1) { //so that there aren't half hexagons on the right side
            Population[i][j].show();
          }//end if
        }//end else
      }//end for2
    }//end for1
  }//end showC

  private void countLivingNeighbours(Cell c) { // c = current cell

    c.liveNeighbours = 0;
    //for all
    if (c.hasNeighboursBelow())//if cell is not bottom cell
    { //
      c.liveNeighbours += Population[c.cellColumn][c.cellRow-1].alive();
    }

    if (c.hasNeighboursLeft()) { //left
      c.liveNeighbours += Population[c.cellColumn-1][c.cellRow].alive();
    }
    if (c.hasNeighboursRight()) { //bottom
      c.liveNeighbours += Population[c.cellColumn+1][c.cellRow].alive();
    }
    if (c.hasNeighboursAbove()) {//right
      c.liveNeighbours += Population[c.cellColumn][c.cellRow+1].alive();
    }
    if (c.evenRow()) {
      if (c.hasNeighboursLeft() && c.hasNeighboursBelow()) {//if1: top left
        c.liveNeighbours += Population[c.cellColumn-1][c.cellRow+1].alive();
      } //end if1
      if (c.hasNeighboursLeft() && c.hasNeighboursAbove()) {//if2: bottom left
        c.liveNeighbours += Population[c.cellColumn-1][c.cellRow-1].alive();
      }//end if2
    } else {
      if (c.hasNeighboursRight() && c.hasNeighboursBelow()) {//if1: top right
        c.liveNeighbours += Population[c.cellColumn+1][c.cellRow+1].alive();
      }//end if1
      if (c.hasNeighboursRight() && c.hasNeighboursAbove()) {//if2: bottom right
        c.liveNeighbours += Population[c.cellColumn+1][c.cellRow-1].alive();
      }//end if2
    }//end else
  }//end count

  void refreshLifeStatus() {
    for (int y = 0; y < verticalCellCount; y++) {//for1
      for (int x = 0; x < horisontalCellCount; x++) {
        countLivingNeighbours(Population[x][y]);
        Population[x][y].updateLife();
        Population[x][y].updateImage();
      }//end for2
    }//end for1
  }
}
