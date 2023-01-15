class Cell { //<>//

  // Public fields

  public int cellColumn;
  public int cellRow;

  // Private fields

  private float cx, cy;
  private boolean isAlive = false;
  private int age = 0;
  private PImage flower = new PImage();
  private int liveNeighbours = 0;

  // Cell constructor

  Cell (int column, int row) {
    cellColumn = column;
    cellRow = row;
    if (evenRow()) { //even rows stay the same, odd rows are shifted to the right (this creates the "beehive" pattern)
      cx = (column+0.5)*cellWidth;
      cy = (1+1.5*row)*cellEdgeLength;
    } else {
      cx = (column+1)*cellWidth;
      cy = (1+1.5*row)*cellEdgeLength;
    }
    isAlive = (random(100) < PERCENT_LIVE_AT_STARTUP );
    if ( isAlive ) {
      age = 1;
      flower = globalImageSelector.aliveDefault;
    } else
    {
      age = 0;
      flower = globalImageSelector.deadDefault;
    }
  }//end Cell constructor

  // Public methods

  boolean evenRow() {
    return (cellRow %2 == 0);
  }

  void updateLife() {
    isAlive = ((liveNeighbours == 3) || ( (liveNeighbours == 2) && isAlive ));
    if (isAlive)
    {
      age = age + 1;
    } else
    {
      age = 0;
    }
  } // end updateLife

  int addNeighbour( boolean aliveNeighbour )
  {
    if ( aliveNeighbour) {
      return 1;
    } else
    {
      return 0;
    }
  }

  // to cehck if cell is on bottom row and can have neighbours below
  boolean hasNeighboursBelow() {
    return (cellRow < globalRowCount-1);
  }

  boolean hasNeighboursLeft() {
    return (cellColumn > 0);
  }

  boolean hasNeighboursRight() {
    return (cellColumn < GLOBAL_COL_COUNT-1);
  }

  boolean hasNeighboursAbove() {
    return (cellRow > 0 );
  }

  void setLiveNeighbours( int aLiveNeighbours ) {
    liveNeighbours = aLiveNeighbours;
  }

  void show () {
    imageMode(CENTER);
    try {
      flower.resize(cellWidth, 0 );
      image( flower, cx, cy );
    }
    catch(Exception e) {
      text( e.getMessage(), cx, cy-12);
    };

    // fill( 255, 0, 0);
    // text( " Live: " + isAlive + " (" + cellRow + ","  + cellColumn + ") N: " + liveNeighbours, cx-singleCellWidth / 3, cy );
  } //end function
}
