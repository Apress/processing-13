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
// star_rotatioin_mandala.pde, chapter 3
// Star plot

void setup(){
  size(1000, 1000);
  translate(width/2, height/2);
  background(0);
  float radOut = height/2.3;
  float radIn = radOut*.5;
  star(8, radIn, radOut);
}
