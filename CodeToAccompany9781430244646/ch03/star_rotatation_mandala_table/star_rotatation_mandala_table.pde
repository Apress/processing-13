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
// star_rotatation_mandala_table.pde, chapter 3
// Star spiral table plot

void setup() {
  size(1000, 1000);
  background(255);
  
  //presets
  int rows = 4;
  int cols = 4;
  float outerRadius = width/cols;

  // randomly generated
  int pointCount;
  int steps;
  float innerRadius;
  float outerRadiusRatio;
  float innerRadiusRatio;
  float shadeRatio;
  float rotationRatio;

  translate(outerRadius/2, outerRadius/2);
  for (int i=0; i<rows; i++) {
    for (int j=0; j<cols; j++) {
      pointCount = int(random(5, 15));
      steps = int(random(3, 20));
      innerRadius = outerRadius*random(.3, .9);
      outerRadiusRatio = outerRadius/steps;
      innerRadiusRatio = innerRadius/steps;
      float randCol = random(225, 255);
      shadeRatio = randCol/steps;
      rotationRatio = random(90, 200)/steps;
      pushMatrix();
      translate(outerRadius*j, outerRadius*i);
      for (int k=0; k<steps; k++) { 
        fill(shadeRatio*k);
        stroke(randCol-shadeRatio*k, 100);
        pushMatrix();
        scale(.4);
        rotate(rotationRatio*k*PI/180);
        star(pointCount, outerRadius-outerRadiusRatio*k, innerRadius-innerRadiusRatio*k);
        popMatrix();
      }
      popMatrix();
    }
  }
}

