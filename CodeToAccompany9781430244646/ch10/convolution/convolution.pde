/*------------------------------------------------------------
Copyright (c) 2013, friends of Ed (An Apress Company)
All rights reserved.

The code provided here accompanies the book:

Processing: Creative Coding and Generative Art in Processing 2
By Ira Greenberg, Dianna Xu, and Deepak Kumar
friends of Ed (An APress Company), 2013
ISBN-13 978-1430244646
Please refer to the associated README for a full disclaimer.
------------------------------------------------------------*/
// convolution.pde, chapter 10
// 9 convolution filters
// Press '0'-'8' to cycle through the filters

float[][][] ks = {{{1, 1, 1}, {1, 1, 1}, {1, 1, 1}}, 
                  {{1, 2, 1}, {2, 4, 2}, {1, 2, 1}},
                  {{1, 0, 0, 0, 0, 0, 0, 0, 0}, {0, 1, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 1, 0, 0, 0, 0, 0, 0},
                  {0, 0, 0, 1, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 1, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 1, 0, 0, 0},
                  {0, 0, 0, 0, 0, 0, 1, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 1, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 1}},
                  {{0, -2, 0}, {-2, 11, -2}, {0, -2, 0}},
                  {{-1, -1, -1}, {-1, 9, -1}, {-1, -1, -1}},
                  {{1, 1, 1}, {1, -7, 1}, {1, 1, 1}},
                  {{0, -1, 0}, {-1, 4, -1}, {0, -1, 0}},
                  {{-1, -1, -1}, {-1, 8, -1}, {-1, -1, -1}},
                  {{1,1,0},{1,0,-1},{0,-1,-1}}};
                  
Filter[] filters = {new Filter(ks[0], 9, 0, "Mean"), 
                    new Filter(ks[1], 16, 0, "Gaussian Blur"),
                    new Filter(ks[2], 9, 0, "Motion Blur"),
                    new Filter(ks[3], 3, 0, "Sharpen"),
                    new Filter(ks[4], 1, 0, "Mean Removal"),
                    new Filter(ks[5], 1, 0, "Mystery"),
                    new Filter(ks[6], 1, 0, "Edge Detection Horizontal/Vertical"),
                    new Filter(ks[7], 1, 0, "Edge Detection with Diagonal"),
                    new Filter(ks[8], 1, 127, "Emboss")};
PImage img, img2;

void setup() {
  img = loadImage("prinzipal.jpg");        //original image
  img2 = createImage(img.width, img.height, RGB);  // new image to store the changed pixels
  size(img.width*2, img.height);

  img.loadPixels();
  img2.loadPixels();
  applyFilter(0);    // apply first filter - Mean
} // end setup()

void draw(){}

void keyPressed() {
  if (key >= '0' && key <= '8') {
    applyFilter(key-'0');
  }
} // end keyPressed()

void applyFilter(int n) {
  for (int y=0; y<img.height; y++ ) {
    for (int x=0; x<img.width; x++) {
      img2.pixels[y*img.width+x] = filters[n].apply(x, y, img); // new color for pixel(x, y) calculated by the filter
    }
  }
  img2.updatePixels();
  image(img, 0, 0);
  image(img2, width/2, 0);
  textSize(20);
  text(filters[n].name, width/2+width/25, height/25);
} // end applyFilter()

