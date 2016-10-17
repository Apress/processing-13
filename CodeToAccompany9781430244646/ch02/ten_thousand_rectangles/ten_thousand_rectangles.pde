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
// ten_thousand_rectangles.pde, chapter 2
// drawing with a for loop example.

size(1100, 1100);
background(255);
noFill();
stroke(0, 0, 0, 150);
for (int i=0; i<10000; i++) {
  float w = random(10, 70);
  float h = random(10, 70);
  rect(random(width-w), random(height-h), w, h);
}

