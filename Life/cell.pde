class Cell { //<>// //<>//

  // Public fields

  public int cellColumn;
  public int cellRow;

  // Private fields

  private FlowerImage img;
  private float cx, cy;
  private boolean isAlive;
  private int age = 0;
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
      img = globalImageSelector.aliveDefault;
    } else
    {
      age = 0;
      img = globalImageSelector.deadDefault;
    }
  }//end Cell constructor

  // Public methods

  boolean evenRow() {
    return (cellRow %2 == 0);
  }

  void updateLife() {  
    isAlive = ((liveNeighbours == 3) || ( ( liveNeighbours >= MIN_NEIGHBOURS ) && ( liveNeighbours <=MAX_NEIGHBOURS  ) && isAlive ) );
    if (isAlive)
    {
      age++;
      if (age > MAX_AGE){
        age = 0;
        isAlive = false;
      }
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

  void setLiveNeighbours( int liveNeighbours ) {
    this.liveNeighbours = liveNeighbours;
    globalImageSelector.updateImage( this );
  }

  void show () { 
    
    imageMode(CENTER);
    try {
      img.Image.resize(cellWidth, 0 );
      image( img.Image, cx, cy );
    }
    catch(Exception e) {
      text( e.getMessage(), cx, cy-12);
    };
      textSize(12);
     fill( 0);
     text( " LI: " + isAlive + " LN: " + liveNeighbours + " AGE: " + age, cx-cellWidth/2+10, cy  );
     text( " Filename: " + img.fileName, cx-cellWidth/2+10, cy+12  );
  } //end function
}
