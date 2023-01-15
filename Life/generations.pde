class Generation {

  public int generationNumber = 0;

  public void showPopulation() {
    for (int rowNo = 0; rowNo < globalRowCount; rowNo++) {
      for (int colNo = 0; colNo < GLOBAL_COL_COUNT; colNo++) {
        cells[colNo][rowNo].show();
      }//end for2
    }//end for1
  }//end show

  private int countLivingNeighbours(Cell c) { // c = current cell

    int liveNeighbours = 0;

    // Check direct neighbors

    if (c.hasNeighboursBelow())
    {
      liveNeighbours += c.addNeighbour( cells[c.cellColumn][c.cellRow+1].isAlive );
    }
    if (c.hasNeighboursLeft()) {
      liveNeighbours += c.addNeighbour( cells[c.cellColumn-1][c.cellRow].isAlive );
    }
    if (c.hasNeighboursRight()) {
      liveNeighbours += c.addNeighbour( cells[c.cellColumn+1][c.cellRow].isAlive );
    }
    if (c.hasNeighboursAbove()) {
      liveNeighbours += c.addNeighbour( cells[c.cellColumn][c.cellRow-1].isAlive );
    }

    // Check oblique neighbors

    if (c.evenRow()) {
      if (c.hasNeighboursLeft() && c.hasNeighboursBelow()) {
        liveNeighbours += c.addNeighbour( cells[c.cellColumn-1][c.cellRow+1].isAlive );
      }
      if (c.hasNeighboursLeft() && c.hasNeighboursAbove()) {
        liveNeighbours += c.addNeighbour( cells[c.cellColumn-1][c.cellRow-1].isAlive );
      }
    } else {
      if (c.hasNeighboursRight() && c.hasNeighboursBelow()) {
        liveNeighbours += c.addNeighbour( cells[c.cellColumn+1][c.cellRow+1].isAlive );
      }
      if (c.hasNeighboursRight() && c.hasNeighboursAbove()) {
        liveNeighbours += c.addNeighbour( cells[c.cellColumn+1][c.cellRow-1].isAlive );
      }
    }
    return liveNeighbours;
  }

  private void refreshLifeStatus() {
    for (int rowNo = 0; rowNo < globalRowCount; rowNo++) {
      for (int colNo = 0; colNo < GLOBAL_COL_COUNT; colNo++) {
        cells[colNo][rowNo].updateLife();
      }
    };
  } // end refreshLifeStatus

  private void updateAllLivingNeighbourCounts() {
    for (int rowNo = 0; rowNo < globalRowCount; rowNo++) {
      for (int colNo = 0; colNo < GLOBAL_COL_COUNT; colNo++) {
        cells[colNo][rowNo].setLiveNeighbours( countLivingNeighbours(cells[colNo][rowNo]) );
      }
    };
  } // countAllLivingNeighbours

  private void updateAllImages() {
    for (int rowNo = 0; rowNo < globalRowCount; rowNo++) {
      for (int colNo = 0; colNo < GLOBAL_COL_COUNT; colNo++) {
        Cell c = cells[colNo][rowNo];
        globalImageSelector.updateImage( c, countLivingNeighbours( c ) );
      }
    };
  } // end updateAllImages

  void newGeneration() {
    updateAllLivingNeighbourCounts();  // Find living neighbours to decide fate
    refreshLifeStatus(); //New life status is updated
    updateAllLivingNeighbourCounts(); //Counts amount of neighbours to decide new image 
    updateAllImages(); //Updates image based of amount of living neighbours in CURRENT generation
    generationNumber++;
  }

  void firstGeneration() {
    updateAllLivingNeighbourCounts();
    updateAllImages();
  }
} // end class
