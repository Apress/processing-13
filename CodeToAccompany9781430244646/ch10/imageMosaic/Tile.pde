class Tile {
  PImage img;
  float avgR;    // average red of tile
  float avgG;    // average green
  float avgB;    // average blue

  Tile(PImage img, int size) {
    this.img = img;
    img.resize(size, size);
    calcAvg();
  }

  void calcAvg() {
    img.loadPixels();
    float r=0, g=0, b=0;

    for (int i=0; i<img.pixels.length; i++) {
      color c = img.pixels[i];
      r += red(c);        // red sum
      g += green(c);      // green sum
      b += blue(c);       // blue sum
    }
    // divide sum by total number of pixels to obtain averages
    avgR = r/img.pixels.length;    
    avgG = g/img.pixels.length;
    avgB = b/img.pixels.length;
  } // end calcAvg()
} // end class Tile

