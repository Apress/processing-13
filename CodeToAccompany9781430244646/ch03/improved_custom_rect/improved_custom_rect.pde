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
// Improved_custom_rect.pde, chapter 3
// Overloaded function example, using 
// different function signatures.

//improved custom rect function
void setup() {
  size(600, 600);
  background(0);
  rect(175, 175, 350, 350, false);
  rect(300, 300, 300, 300, true);
}

void rect(float x, float y, float w, float h, boolean isRect){
  if (isRect){
    rect(x, y, w, h); // call Processing's rect()
  } 
  
  if (!isRect){
    ellipse(x, y, w, h); // call Processing's ellipse()
  }
}
