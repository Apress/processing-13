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
// star_rotatation_mandala_2.pde, chapter 3
// Star mandala plot 2


void setup() {
  size(1000, 1000);
  background(0);
  noStroke();
  translate(width/2, height/2);

  int pointCount = 8;
  int steps = 50;
  float outerRadius = width*.5;
  float innerRadiusFactor = .7;
  float innerRadius = outerRadius*innerRadiusFactor;
  float outerRadiusRatio = outerRadius/steps;
  float innerRadiusRatio = innerRadius/steps;
  float shadeRatio = 255.0/steps;
  float rotationRatio = 45.0/steps;

  for (int i=0; i<steps; i++) { 
    stroke(255-shadeRatio*i, 100);
    fill(shadeRatio*i);
    pushMatrix();
    rotate(rotationRatio*i*PI/180);
    star(pointCount, outerRadius-outerRadiusRatio*i, innerRadius-innerRadiusRatio*i);
    popMatrix();
  }
}

