class Tile {
  int sz;       // size of tile
  int x, y;     // x, y coords of top left corner of tile
  int orient;   // orientation of tile

  Tile(int x, int y, int w) {
    this.x = x;
    this.y = y;
    sz = w;
    orient = randInt(0, 3);
  } // end Tile()

  void display() {
    pushMatrix();    
    translate(x, y);          // move to tile’s x-y location (upper left corner)
    translate(sz/2, sz/2);    // move to the center of the tile
    rotate(orient*PI/2);      // rotate by the appropriate angle
    translate(-sz/2, -sz/2);  // move back to the upper left corner

    fill(0);
    triangle(sz, 0, sz, sz, 0, sz);

    // variation with a pair of arcs
    //stroke(0);
    //noFill();
    //arc(0, 0, sz, sz, 0, PI/2);
    //arc(sz, sz, sz, sz, PI, 3*PI/2);

    popMatrix();
  } // end draw()
} // end class Tile

int randInt(int low, int high) {
  int r =  floor(random(low, high+1));
  r = constrain(r, low, high);
  return r;
} // end randInt()

