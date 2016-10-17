/*------------------------------------------------------------
Copyright (c) 2013, Friends of Ed (An Apress Company)
All rights reserved.

The code provided here accompanies the book:

Processing: Creative Coding and Generative Art in Processing 2
By Ira Greenberg, Dianna Xu, and Deepak Kumar
Friends of Ed (An APress Company), 2013
ISBN-13 978-1430244646
Please refer to the associated README for a full disclaimer.
------------------------------------------------------------*/

// Sketch 6-4: Two balls and a stick
ball b1, b2;
stick s;
int stickLen = 80;
void setup() {
  size(400, 400);
  smooth();  
  
  b1 = new ball(width/2, height/2+stickLen/2, 10, color(0));
  b2 = new ball(width/2, height/2+stickLen, 10, color(0));
  s = new stick(b1, b2);
} // setup()
void draw() {
  background(255);
  s.update();
  s.display();
} // draw()

