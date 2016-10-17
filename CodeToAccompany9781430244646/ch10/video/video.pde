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
// video.pde, chapter 10
// Basic video playback

import processing.video.*;    //video libraries
Capture vid;                  //Capture object for our video

void setup() {
  size(640, 480);
  vid = new Capture(this, width, height);  // initialize camera
  // Start capturing frames, new method in 2.0, not available in 1.x
  vid.start();
}

void draw() {
  if (vid.available()) {    // if a new image is available
    vid.read();             // read the current image
  }
  image(vid, 0, 0);         // display the current video image to screen
}

