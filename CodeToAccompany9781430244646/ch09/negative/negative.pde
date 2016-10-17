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
// negative.pde, chapter 9
// Convert image to the negative

void setup() {
  PImage img = loadImage("prinzipal.jpg");
  size(img.width, img.height);
  image(img, 0, 0);

  for (int y=0; y<img.height; y++) {
    for (int x=0; x<img.width; x++) {
      color c = get(x, y);
      set(x, y, color(255-red(c), 255-green(c), 255-blue(c)));
    }
  }
} // end setup()

