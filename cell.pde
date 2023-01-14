

class cell {
  float x, y;
  int alive;
  int age;
  int ne; //number of alive neighbors
  PImage flower = d00;

  cell (float xpos, float ypos) {
    x = xpos;
    y = ypos;
    ne = 0;
    alive = round(random(1));
    age = 0;
  }//end definition

  void show () {
    imageMode(CENTER);
    if (alive == 0) {
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
