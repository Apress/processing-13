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
// star_rotatation_mandala_3.pde, chapter 3
// Star mandala plot 3

void setup() {
  size(1000, 1000);
  background(0);
  noStroke();
  translate(width/2, height/2);

  int pointCount = int(random(3, 12));
  int steps = int(random(30, 80));
  float outerRadius = width*random(.3, .6);
  float innerRadiusFactor = random(.2, .9);
  float innerRadius = outerRadius*innerRadiusFactor;
  float outerRadiusRatio = outerRadius/steps;
  float innerRadiusRatio = innerRadius/steps;
  float randCol = random(175, 255);
  float shadeRatio = randCol/steps;
  float rotationRatio = random(25.0, 145.0)/steps;

  for (int i=0; i<steps; i++) { 
    fill(shadeRatio*i);
    stroke(randCol-shadeRatio*i, 100);
    pushMatrix();
    rotate(rotationRatio*i*PI/180);
    star(pointCount, outerRadius-outerRadiusRatio*i, innerRadius-innerRadiusRatio*i);
    popMatrix();
  }
}

