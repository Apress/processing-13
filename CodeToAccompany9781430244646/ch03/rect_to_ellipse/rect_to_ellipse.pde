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
// rect_to_ellipse.pde, chapter 3
// Override built-in function example.

void setup() {
  size(400, 400);
  background(100);
  rect(width/2, height/2, 300, 300);
}

// overrides Processing's rect function
void rect(float x, float y, float w, float h) {
  ellipse(x, y, w, h);
}
