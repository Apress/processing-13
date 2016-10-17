class Filter{
  float[][] kernel;      // convolution kernel
  float normalizer;      // normalizing factor
  float offset;          // brightening offset
  String name;           // display label
  
  Filter(float[][] kernel, float normalizer, float offset, String name) {
    this.kernel = kernel; 
    this.normalizer = normalizer;
    this.offset = offset;
    this.name = name;
  } // end Filter()
  
  // returns the color for pixel(x, y) after applying filter
  color apply(int x, int y, PImage img) {
    int halfSize = kernel.length/2;       // used for moving from the center out to the corners
    float r = 0.0, g = 0.0, b = 0.0;

    for (int i = 0; i < kernel.length; i++) {
      for (int j= 0; j < kernel[i].length; j++) {
        // Which neighbor are we using
        int newX = x+i-halfSize;
        int newY = y+j-halfSize;
        int idx = img.width*newY + newX;
        idx = constrain(idx, 0, img.pixels.length-1);        // constraint the edge pixels
        // Calculate the convolution 
        r += (red(img.pixels[idx]) * kernel[i][j]/normalizer);
        g += (green(img.pixels[idx]) * kernel[i][j]/normalizer);
        b += (blue(img.pixels[idx]) * kernel[i][j]/normalizer);
      }
    }

    return color(r+offset, g+offset, b+offset);
  } // end apply()
} // end class Filter
