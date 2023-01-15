class Generation {

  public int generationNumber = 0;


  private int boolToInt( boolean aliveNeighbour )
  {
    if ( aliveNeighbour) {
      return 1;
    } else
    {
      return 0;
    }
  }

  public void showAll() {
    for (int rowNo = 0; rowNo < globalRowCount; rowNo++) {
      for (int colNo = 0; colNo < GLOBAL_COL_COUNT; colNo++) {
        cells[colNo][rowNo].show();
      }//end for2
    }//end for1
  }//end show

  private int countLivingNeighboursForOneCell(Cell c) { 

    int liveNeighbours = 0;

    // Check direct neighbors

    if (c.hasNeighboursBelow())
    {
      liveNeighbours += boolToInt( cells[c.cellColumn][c.cellRow+1].isAlive );
    }
    if (c.hasNeighboursLeft()) {
      liveNeighbours += boolToInt( cells[c.cellColumn-1][c.cellRow].isAlive );
    }
    if (c.hasNeighboursRight()) {
      liveNeighbours += boolToInt( cells[c.cellColumn+1][c.cellRow].isAlive );
    }
    if (c.hasNeighboursAbove()) {
      liveNeighbours += boolToInt( cells[c.cellColumn][c.cellRow-1].isAlive );
    }

    // Check oblique neighbors

    if (c.evenRow()) {
      if (c.hasNeighboursLeft() && c.hasNeighboursBelow()) {
        liveNeighbours += boolToInt( cells[c.cellColumn-1][c.cellRow+1].isAlive );
      }
      if (c.hasNeighboursLeft() && c.hasNeighboursAbove()) {
        liveNeighbours += boolToInt( cells[c.cellColumn-1][c.cellRow-1].isAlive );
      }
    } else {
      if (c.hasNeighboursRight() && c.hasNeighboursBelow()) {
        liveNeighbours += boolToInt( cells[c.cellColumn+1][c.cellRow+1].isAlive );
      }
      if (c.hasNeighboursRight() && c.hasNeighboursAbove()) {
        liveNeighbours += boolToInt( cells[c.cellColumn+1][c.cellRow-1].isAlive );
      }
    }
    return liveNeighbours;
  }

  private void updateLifeStatusForAll() {
    for (int rowNo = 0; rowNo < globalRowCount; rowNo++) {
      for (int colNo = 0; colNo < GLOBAL_COL_COUNT; colNo++) {
        cells[colNo][rowNo].updateLife();
      }
    };
  } // end updateLifeStatusForAll

  private void updateLivingNeighbourCountForAll() {
    for (int rowNo = 0; rowNo < globalRowCount; rowNo++) {
      for (int colNo = 0; colNo < GLOBAL_COL_COUNT; colNo++) {
        cells[colNo][rowNo].updateLiveNeigbours( countLivingNeighboursForOneCell(cells[colNo][rowNo]) );
      }
    };
  } // updateLivingNeighbourCountForAll

  public void growNewGeneration() {
    generationNumber++;
    updateLifeStatusForAll(); //New life status is updated
    updateLivingNeighbourCountForAll(); //Find number of living neighbours to decide new image ( and fate in the next ) 
  }

  public void plantFirstGeneration() {
    generationNumber = 0;
    updateLivingNeighbourCountForAll();
  }
  
} // end class
