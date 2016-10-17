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
// obamicon.pde, chapter 10
// Convert an image to an Obamicon

void setup() {
  PImage img = loadImage("Lenna.png");
  color darkBlue = color(0, 51, 76);
  color red = color(217, 26, 33);
  color lightBlue = color(112, 150, 158);
  color yellow = color(252, 227, 166);
  
  size(img.width, img.height);
  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];
    //float total = red(c)+green(c)+blue(c);
    float gray = red(c)*0.3+green(c)*0.59+blue(c)*0.11;
    if (gray < 60) {
      img.pixels[i] = color(darkBlue);
    }
    else if (gray < 122) {
      img.pixels[i] = color(red);
    }
    else if (gray < 185) {
      img.pixels[i] = color(lightBlue);
    }
    else {
      img.pixels[i] = color(yellow);
    }
  }
  img.updatePixels();  
  image(img, 0, 0);
}


