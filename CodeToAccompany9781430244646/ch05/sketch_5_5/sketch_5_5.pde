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

// Sketch 5-5: Visualizing Time Series (AAPL Stock prices)
float[] price;

float X1, Y1, X2, Y2;

void setup() {

  // drawing setup
  size(600, 400);

  X1 = 50; 
  Y1 = 50;
  X2 = width - 50; 
  Y2 = height - Y1;

  smooth();
} // setup()

void draw() {
  background(0);

  // draw plot bounding box
  rectMode(CORNERS);
  noStroke();
  fill(255);
  rect(X1, Y1, X2, Y2);
} // draw()

