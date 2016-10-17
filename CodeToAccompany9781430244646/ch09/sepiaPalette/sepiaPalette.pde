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
// sepiaPalette.pde, chapter 9
// Create and visualize a Sepia palette

void setup() {
  int s = 10;
  color[] palette = new color[256];
  size(s*32+1, s*8+1);
  // yellow sepia
  int r = 255;
  int g = 240;
  int b = 192;
  // red sepia
  //int r = 255;
  //int g = 220;
  //int b = 192;

  for (int i=0; i<palette.length; i++) {
    palette[i] = color(r*i/255, g*i/255, b*i/255);
    pushMatrix();
    translate((i%32)*s, (i/32)*s);
    fill(palette[i]);
    stroke(255, 255, 255);
    rect(0, 0, s, s);
    popMatrix();
  }
}

