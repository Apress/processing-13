class Tile {
  int sz;             // size of tile
  int x, y;           // x, y coords of top left corner of tile
  int orient;         // orientation of tile
  boolean swapColors; // whether we should swap inside and outside colors
  color ic;           // inside color – fill color of arc if swapColor is false
  color oc;           // outside color – fill color of background square if swapColor is false

  Tile(int x, int y, int w, color ic, color oc) {
    this.x = x;
    this.y = y;
    sz = w;
    this.ic = ic;
    this.oc = oc;
    orient = randInt(0, 1);  // only two unique orientations
  } // end Tile()

  void display() {
    pushMatrix();

    translate(x, y);
    noStroke();
    if (swapColors) {
      fill(ic);
    }
    else {
      fill(oc);
    }
    rect(0, 0, sz, sz);

    translate(sz/2, sz/2);
    rotate(orient*PI/2);
    translate(-sz/2, -sz/2);
    stroke(255);
    strokeWeight(3);
    if (swapColors) {
      fill(oc);
    }
    else {
      fill(ic);
    }
    arc(0, 0, sz, sz, 0, PI/2);
    arc(sz, sz, sz, sz, PI, 3*PI/2);

    popMatrix();
  } // end draw()
} // end class Tile

int randInt(int low, int high) {
  int r =  floor(random(low, high+1));
  r = constrain(r, low, high);
  return r;
} // end randInt()

