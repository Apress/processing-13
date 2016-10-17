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
// star_rotatation_mandala_spiral.pde, chapter 3
// Star spiral plot


void setup() {
  size(800, 800);
  background(255);
  
  //presets
  int nodes = 30;
  float spiralRadius = width*.4;
  float spiralTheta = 0.0;
  float x = 0.0, y = 0.0;
  
  float outerRadius = 170.0;
  
  // randomly generated
  int pointCount = 0;
  int steps = 0;
  float innerRadius = 0.0;
  float outerRadiusRatio = 0.0;
  float innerRadiusRatio = 0.0;
  float shadeRatio = 0.0;
  float rotationRatio = 0.0;
  
  translate(width/2, height/2);
  for (int i=0; i<nodes; i++) {
      pointCount = int(random(5, 15));
      steps = int(random(4, 15));
      innerRadius = outerRadius*random(.3, .9);
      outerRadiusRatio = outerRadius/steps;
      innerRadiusRatio = innerRadius/steps;
      float randCol = random(225, 255);
      shadeRatio = randCol/steps;
      rotationRatio = random(90, 200)/steps;
      pushMatrix();
      x = cos(spiralTheta)*spiralRadius;
      println(x);
      y = sin(spiralTheta)*spiralRadius;
      translate(x, y);
      for (int k=0; k<steps; k++) { 
        if (k%int(random(1, 6))==0) {
          stroke(0, 50);
        } 
        else {
          noStroke();
        }
        fill(randCol-shadeRatio*k);
        pushMatrix();
        scale(.4);
        rotate(rotationRatio*k*PI/180);
        star(pointCount, outerRadius-outerRadiusRatio*k, innerRadius-innerRadiusRatio*k);
        popMatrix();
      }
      popMatrix();
      outerRadius *= .93;
      spiralRadius -=15;
      spiralTheta += TWO_PI/(nodes*.5);
    }
}

