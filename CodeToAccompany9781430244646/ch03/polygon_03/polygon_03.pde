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
// polygon_03.pde, chapter 3
// stage 3

void setup(){
  size(400, 400);
  background(255);
  fill(100);
  translate(width/2, height/2);
  rotate(PI/7);
  polygon(100.0);
}
