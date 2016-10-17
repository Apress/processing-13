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
// thresholdMouse.pde, chapter 10
// Dynamically applying the THRESHOLD filter according to the mouse y position
// Press and hold down the mouse and move in the sketch window

PImage img;
void setup() {
  img = loadImage("woods2.jpg");
  size(img.width, img.height);
  image(img, 0, 0);
} // end setup()

void draw() {}

void mouseDragged() {
  float t = map(mouseY, 0, height, 0.0, 1.0);
  image(img, 0, 0);
  filter(THRESHOLD, t);
} // end mouseDragged()

