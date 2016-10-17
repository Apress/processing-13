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
// imageMask.pde, chapter 10
// Masking out the sky in an image

void setup() {
  PImage img = loadImage("prinzipal.jpg");
  size(img.width*2, img.height);  //Twice the width so that we can display the result and the original side by side
  PImage msk = createImage(img.width, img.height, RGB); //the mask should be an image the same size as the original
  background(0);
  img.loadPixels();
  msk.loadPixels();
  for (int y=0; y<img.height; y++){
    for (int x=0; x<img.width; x++){
      color c = img.pixels[y*img.width+x];
      if (red(c) + green(c) + blue(c) > 600 || blue(c) > 190) { // cloud or sky
         msk.pixels[y*img.width+x] = 0;
      }
      else {
        msk.pixels[y*img.width+x] = 255;
      } 
    }
  }
  msk.updatePixels();
  image(img, 0, 0);
  img.mask(msk);
  image(img, img.width, 0);
} // end setup()

