class Generation {

  int generationNumber = 0;

  void showPopulation() {
    for (int row = 0; row < globalRowCount; row++) {
      for (int col = 0; col < globalColCount; col++) {
        Population[col][row].show();
      }//end for2
    }//end for1
  }//end show

  private void countLivingNeighbours(Cell c) { // c = current cell

    c.liveNeighbours = 0;

    // Check direct neighbors

    if (c.hasNeighboursBelow())
    {
      c.liveNeighbours += Population[c.cellColumn][c.cellRow-1].alive();
    }
    if (c.hasNeighboursLeft()) {
      c.liveNeighbours += Population[c.cellColumn-1][c.cellRow].alive();
    }
    if (c.hasNeighboursRight()) {
      c.liveNeighbours += Population[c.cellColumn+1][c.cellRow].alive();
    }
    if (c.hasNeighboursAbove()) {
      c.liveNeighbours += Population[c.cellColumn][c.cellRow+1].alive();
    }

    // Check oblique neighbors

    if (c.evenRow()) {
      if (c.hasNeighboursLeft() && c.hasNeighboursBelow()) {
        c.liveNeighbours += Population[c.cellColumn-1][c.cellRow-1].alive();
      }
      if (c.hasNeighboursLeft() && c.hasNeighboursAbove()) {
        c.liveNeighbours += Population[c.cellColumn-1][c.cellRow+1].alive();
      }
    } else {
      if (c.hasNeighboursRight() && c.hasNeighboursBelow()) {
        c.liveNeighbours += Population[c.cellColumn+1][c.cellRow-1].alive();
      }//end if1
      if (c.hasNeighboursRight() && c.hasNeighboursAbove()) {
        c.liveNeighbours += Population[c.cellColumn+1][c.cellRow+1].alive();
      }
    }
  }

  void refreshLifeStatus() {
    for (int y = 0; y < globalRowCount; y++) {//for1
      for (int x = 0; x < globalColCount; x++) {
        countLivingNeighbours(Population[x][y]);
        if (generationNumber>0) {
          Population[x][y].updateLife();
        }
        Population[x][y].updateImage();
      }
    };
    generationNumber++;
  } // end refresh
} // end class
