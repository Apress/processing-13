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
// animated_rectangle_painting.pde, chapter 4
// Introducing Processing's draw() function.

void setup(){
  size(800, 800);
  background(0);
  noFill();
}

void draw(){
  stroke(255, random(255));
  rect(random(width), random(height), random(5, 20), random(5, 20));
}
