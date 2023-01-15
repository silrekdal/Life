class GenerationClass {

  public int generationNumber = 0;

  public void showPopulation() {
    for (int rowNo = 0; rowNo < globalRowCount; rowNo++) {
      for (int colNo = 0; colNo < GLOBAL_COL_COUNT; colNo++) {
        cells[colNo][rowNo].show();
      }//end for2
    }//end for1
  }//end show

  private int countLivingNeighbours(CellMatrix c) { // c = current cell

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

 public void updateAllLivingNeighbourCounts() {
    for (int rowNo = 0; rowNo < globalRowCount; rowNo++) {
      for (int colNo = 0; colNo < GLOBAL_COL_COUNT; colNo++) {
        cells[colNo][rowNo].setLiveNeighbours( countLivingNeighbours(cells[colNo][rowNo]) );
      }
    };
  } // countAllLivingNeighbours

  void updateAllImages() {
    for (int rowNo = 0; rowNo < globalRowCount; rowNo++) {
      for (int colNo = 0; colNo < GLOBAL_COL_COUNT; colNo++) {
        CellMatrix c = cells[colNo][rowNo];
        imgSelector.updateImage( c, countLivingNeighbours( c ) );
      }
    };
  } // end updateAllImages

  void newGeneration() {
    updateAllLivingNeighbourCounts();
    // Life status is based on the living neighbors in the last generation
    refreshLifeStatus();
    // The images are based on the living neighbors in this generation
    updateAllImages();
    generationNumber++;
  }
} // end class
