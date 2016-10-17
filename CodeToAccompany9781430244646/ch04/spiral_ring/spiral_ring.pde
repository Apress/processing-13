// spiral Ring
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
// spiral_ring.pde, chapter 4
// Generates a connected spiral ring.

float x, y;
int spiralCount = 10, spiralDetail = 70;
float ringRadius = 150, spiralRadius = 20;
float theta, phi;

void setup() {
  size(500, 500);
  background(255);

  translate(width/2, height/2);
  beginShape();
  for (int i=0; i<spiralCount; i++) {

    x = cos(theta)*ringRadius;
    y = sin(theta)*ringRadius;
    phi = theta + PI;
    for (int j=0; j<spiralDetail; j++) {
      float x2 = x+cos(phi)*spiralRadius;
      float y2 = y+sin(phi)*spiralRadius;
      vertex(x2, y2);
      phi -= TWO_PI/(spiralDetail);
    }

    theta +=TWO_PI/spiralCount;
  }
  endShape(CLOSE);
}


