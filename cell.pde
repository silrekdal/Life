

class Cell {
  float x, y;
  boolean isAlive;
  int age;
  int liveNeighbours; //number of alive neighbors
  PImage flower = d00;

  Cell (float xpos, float ypos) {
    x = xpos;
    y = ypos;
    liveNeighbours = 0;
    isAlive = (random(1) >= 0.500);
    age = 0;
  }//end definition

  void show () {
    imageMode(CENTER);
    if (isAlive == 0) {
      image(d01, x, y);
      d01.resize (d, 0);
    } else {
      image(d00, x, y);
      d00.resize (d, 0);
    } //end if/else

    /*beginShape();
     vertex (x, y + s);
     vertex (x + d/2, y + s/2);
     vertex (x + d/2, y - s/2);
     vertex (x, y - s);
     vertex (x - d/2, y- s/2);
     vertex (x - d/2, y + s/2);
     endShape(CLOSE);*/
  }//end function
}//end class
