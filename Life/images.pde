class ImageSelector { //<>//

  private PImage d00, d01, d02, d04, d05, d06, d12, d13, d22, d23, d32, d33, d42, d43;
  private PImage deadDefault, aliveDefault,emptyHexagon;

  public ImageSelector() {

    //load all images to create different modes
    d00 = loadImage("00.png");
    d01 = loadImage("01.png");
    d02 = loadImage("02.png");
    d04 = loadImage("04.png");
    d05 = loadImage("05.png");
    d06 = loadImage("06.png");
    d12 = loadImage("12.png");
    d13 = loadImage("13.png");
    d22 = loadImage("22.png");
    d23 = loadImage("23.png");
    d32 = loadImage("32.png");
    d33 = loadImage("33.png");
    d42 = loadImage("42.png");
    d43 = loadImage("43.png");

    // We don't have images for all combinations of neighbours and life status, use defaults for those

    deadDefault = loadImage("dead.png");
    aliveDefault = loadImage("alive.png");
    emptyHexagon = loadImage("empty.png");
    
  } // End of constructor

  public void updateImage(Cell c, int liveNeighbours) {
    if (c.isAlive) {
      updateImageAlive( c, liveNeighbours );
    } else {
      updateImageDead( c, liveNeighbours );
    }
    c.flower = emptyHexagon;
  } // end updateImage

  private void updateImageAlive( Cell c, int liveNeighbours ) {
    int lifeStage = ((c.age-1) / GENERATIONS_PER_STAGE)+1;
    println( "LIVE @ XY(", c.cellColumn, ",", c.cellRow, ") Age: ", c.age, " Stage: ", lifeStage, "Live neighbours: ", liveNeighbours );
    switch( lifeStage ) {
    case 1:
      {

        if (liveNeighbours == 2) {
          c.flower = d12;
        } else if (liveNeighbours == 3) {
          c.flower = d13;
        }
        break;
      }
    case 2:
      {
        if (liveNeighbours == 2) {
          c.flower = d22;
        } else if (liveNeighbours == 3) {
          c.flower = d23;
        }
        break;
      }
    case 3:
      {
        if (liveNeighbours == 2) {
          c.flower = d32;
        } else if (liveNeighbours == 3) {
          c.flower = d33;
        }
        break;
      }
    case 4:
      {
        if (liveNeighbours == 2) {
          c.flower = d42;
        } else if (liveNeighbours == 3) {
          c.flower = d43;
        }
        break;
      }
    default:
      c.flower = aliveDefault;
      break;
    }
  } // end function

  private void updateImageDead(Cell c, int liveNeighbours ) {
    println( "DEAD @ XY(", c.cellColumn, ",", c.cellRow, ") Live neighbours: ", liveNeighbours );
    switch (liveNeighbours) {
    case 0:
      c.flower = d00;
      break;
    case 1:
      c.flower = d01;
      break;
    case 2:
      c.flower = d02;
      break;
    case 4:
      c.flower = d04;
      break;
    case 5:
      c.flower = d05;
      break;
    case 6:
      c.flower = d06;
      break;
    default:
      c.flower = deadDefault;
      break;
    }
  } // updateImageDead
} // end class
