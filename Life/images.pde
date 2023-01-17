class FlowerImage  //<>// //<>//
{
  public String fileName;
  public PImage pngImage;
  public FlowerImage( String FileName ) {
    fileName = FileName;
    pngImage = loadImage( fileName );
    pngImage.resize( cellWidth, 0 );
  }
}

class ImageSelector {

  public FlowerImage defaultImage( boolean alive)
  {
    if ( alive )
      return aliveDefault;
    else
      return deadDefault;
  }

  private FlowerImage d00, d01, d02, d04, d05, d06, d12, d13, d22, d23, d32, d33, d42, d43;
  private FlowerImage deadDefault, aliveDefault, emptyHexagon;

  public ImageSelector() {

    //load all images to create different modes
    d00 = new FlowerImage("00.png");
    d01 = new FlowerImage("01.png");
    d02 = new FlowerImage("02.png");
    d04 = new FlowerImage("04.png");
    d05 = new FlowerImage("05.png");
    d06 = new FlowerImage("06.png");
    d12 = new FlowerImage("12.png");
    d13 = new FlowerImage("13.png");
    d22 = new FlowerImage("22.png");
    d23 = new FlowerImage("23.png");
    d32 = new FlowerImage("32.png");
    d33 = new FlowerImage("33.png");
    d42 = new FlowerImage("42.png");
    d43 = new FlowerImage("43.png");

    // We don't have images for all combinations of neighbours and life status, use defaults for those

    deadDefault = new FlowerImage("0.png");
    aliveDefault = new FlowerImage("1.png");
    emptyHexagon = new FlowerImage("empty.png");

    
  } // End of constructor

  public void updateImage(Cell c ) {
    if ( showTextOnly )
    {
      c.img = emptyHexagon;
    } else if (c.isAlive) {
      updateImageAlive( c );
    } else {
      updateImageDead( c );
    }
  } // end updateImage

  private void updateImageAlive( Cell c ) {
    int lifeStage = ((c.age-1) / GENERATIONS_PER_STAGE)+1;
    if ( consoleDebugging )
      println( "LIVE @ XY(", c.cellColumn, ",", c.cellRow, ") Age: ", c.age, " Stage: ", lifeStage, "Live neighbours: ", c.liveNeighbours );
    switch( lifeStage ) {
    case 1:
      {

        if (c.liveNeighbours == 2) {
          c.img = d12;
        } else if (c.liveNeighbours == 3) {
          c.img = d13;
        } else
          c.img= aliveDefault;
        break;
      }
    case 2:
      {
        if (c.liveNeighbours == 2) {
          c.img = d22;
        } else if (c.liveNeighbours == 3) {
          c.img = d23;
        } else
          c.img= aliveDefault;
        break;
      }
    case 3:
      {
        if (c.liveNeighbours == 2) {
          c.img = d32;
        } else if (c.liveNeighbours == 3) {
          c.img = d33;
        } else
          c.img= aliveDefault;
        break;
      }
    case 4:
      {
        if (c.liveNeighbours == 2) {
          c.img = d42;
        } else if (c.liveNeighbours == 3) {
          c.img = d43;
        } else
          c.img= aliveDefault;
        break;
      }
    default:
      c.img = aliveDefault;
      break;
    }
  } // end function

  private void updateImageDead(Cell c ) {
    if ( consoleDebugging )
      println( "DEAD @ XY(", c.cellColumn, ",", c.cellRow, ") Live neighbours: ", c.liveNeighbours );
    switch (c.liveNeighbours) {
    case 0:
      c.img = d00;
      break;
    case 1:
      c.img = d01;
      break;
    case 2:
      c.img = d02;
      break;
    case 4:
      c.img = d04;
      break;
    case 5:
      c.img = d05;
      break;
    case 6:
      c.img = d06;
      break;
    default:
      c.img = deadDefault;
      break;
    }
  } // updateImageDead
} // end class
