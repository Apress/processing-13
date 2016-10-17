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
// primary_creation_01.pde, chapter 4
// Plotting primes using return functions.

void setup() {
  size(800, 600);
  background(0);
  float cols = 40;
  float rows = 30;
  float cellW = width/cols;
  float cellH = height/rows;
  noStroke();

  for (int i=0, k=0; i<rows; i++) {
    for (int j=0; j<cols; j++) {
      pushMatrix();
      translate(cellW/2+cellW*j, cellH/2+cellH*i);
      if (isPrime(k)) {
        primeCell(cellW, cellH);
      } 
      else {
        compositeCell(cellW, cellH);
      }
      popMatrix();
      k++;
    }
  }
}// end setup


void primeCell(float w, float h) {
  fill(255, 0, 0);
  ellipse(0, 0, w, h);
} // end primeCell

void compositeCell(float w, float h) {
  fill(255);
  rect(-w/2, -h/2, w, h);
} // end compositeCell

// return true or false
boolean isPrime(int val) {
  if (val<2) {
    return false;
  } 
  for (int i=2; i<(val+2)/2; i++) {
    if (val%i==0) {
      return false;
    }
  }
  return true;
} // end isPrime

