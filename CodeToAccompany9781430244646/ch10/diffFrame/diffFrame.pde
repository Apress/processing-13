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
// diffFrame.pde, chapter 10 
// Display the pixel differences in successive frames in a video

import processing.video.*;
Capture vid;
PImage prevFrame;

void setup() {
  size(640, 480);
  vid = new Capture(this, width, height);
  prevFrame = createImage(width, height, ARGB);
  vid.start();
} // end setup()

void draw() {
  if (vid.available()) {
    vid.read();
    prevFrame.blend(vid, 0, 0, width, height, 0, 0, width, height, SUBTRACT); 
    image(prevFrame, 0, 0);
    prevFrame.copy(vid, 0, 0, width, height, 0, 0, width, height);
  }
} // end draw()

