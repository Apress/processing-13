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
// polygonal_pattern.pde, chapter 3
// create polygonal wallpaper

void setup() {
  size(800, 800);
  background(255);
  int polyCount = 3000;
  noFill();
  int sideCount = 0;
  float radius = 0.0;
  float rotation = 0.0;
  
  for (int i=0; i<polyCount; i++) {
    sideCount = int(random(3, 15));
    radius = random(2, 20);
    rotation = random(TWO_PI);
    pushMatrix();
    translate(random(width), random(height));
    rotate(rotation);
    polygon(sideCount, radius);
    popMatrix();
  }
}

