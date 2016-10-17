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
// complex_algorithmic_face.pde, chapter 2
// Complex algorithmic approach to drawing a face using
// functions and curves.

// BEGIN DECLARE/INITIALIZE HEAD VARIABLES
float headHeight = 600;
float headWidth = headHeight*5/7;
float head_x = (width-headWidth)/2;
float head_y = (height-headHeight)/2;

void setup() {
  size(600, 800);
  background(0);
  stroke(255);
  noFill();

  ellipseMode(CORNER); 
  translate(width/2, height/2);
  // Draw head
  head(head_x, head_y, headWidth, headHeight);
  
}

