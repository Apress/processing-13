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
// decode.pde, chapter 9
// Decodes an encoded image, assuming information stored in least significant 4 bits

PImage img; 

int clearMask = 0xF0F0F0;  // & with color to remove leftmost 4 bits from all R/G/B channels

void setup() {
  img = loadImage("encoded.png");   // Load the encoded picture
  size(img.width, img.height);      // Size the sketch to be the same size as the picture

  img.loadPixels();  
  for (int i=0; i<img.pixels.length; i++) {
    color ip = img.pixels[i];
    // Strip off the most significant 4 bits of R, G, and B colors
    ip = ip & ~clearMask;
    // left shift and move the least significant 4 bits into the leftmost position.
    ip = ip << 4;
    // Replace the decoded pixel back into the picture
    img.pixels[i] = ip;
  }

  img.updatePixels();
  image(img, 0, 0);
} // end setup()

