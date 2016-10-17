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
// textVideo.pde, chapter 10
// Replacing video frame pixel blocks with squares or ascii text

import processing.video.*;
Capture vid;
int s = 10;

void setup() {
  size(1600, 1000);
  vid = new Capture(this, width/s, height/s);
  vid.start();
} // end setup()

void draw() {
  if (vid.available()) {
    vid.read();  
    vid.loadPixels();    
    for (int y=0; y<height/s; y++) {
      for (int x=0; x<width/s; x++) {
        color c = vid.pixels[y*vid.width+x];
        fill(c);
        //text(x%2, x*s, y*s);
        rect(x*s, y*s, s, s);
      }
    }
  }
} // end draw()

