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
// rectangle_plot.pde, chapter 3
// Using Processing's drawing functions. 

void setup(){
  size(600, 600);
  background(255);
  plotRect(100, 100, 400, 400);
} // end setup

void plotRect(float x, float y, float w, float h) {
 beginShape();
 vertex(x, y);
 vertex(x, y+h);
 vertex(x+w, y+h);
 vertex(x+w, y);
 endShape(CLOSE);
} // end plotRect
