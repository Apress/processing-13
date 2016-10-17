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
// spineCreature.pde, chapter 4
// Example of closed spline curve.

void setup(){
  size(600, 600);
  background(255);
  translate(width/2, height/2);
  flower(6, 175, 290, 0);
}

void flower(int petalCount, float budRadius, 
          float petalRadius, float tightness){
  
  curveTightness(tightness);
  float theta = 0;
  int vertices = petalCount*3;
  beginShape();
  float x = 0;
  float y = 0;
  float rot = TWO_PI/vertices;
  for (int i=0; i<vertices; i++){
    x = cos(theta)*budRadius;
    y = sin(theta)*budRadius;
    curveVertex(x, y);
    theta += rot;
    
    x = cos(theta)*petalRadius;
    y = sin(theta)*petalRadius;
    curveVertex(x, y);
    theta += rot;
    
    x = cos(theta)*budRadius;
    y = sin(theta)*budRadius;
    curveVertex(x, y);
    theta += rot;
  }
  endShape();
}
