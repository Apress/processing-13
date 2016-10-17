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
// rotating_square_accurate_collision.pde, chapter 4
// Combining animation, transformations and 
// accurate collision detection.

// declare global variables
// for moving square
float x, y, w;
float spdX, spdY, theta, rotSpd;

// enables accurate wall collisions
float cornerRadiusOffset, dynamicRadius, collisionTheta;

void setup() {
  size(600, 600);
  // initialize global variables
  x = width/2;
  y = height/2;
  w = 150;
  spdX = 2.1;
  spdY = 1.5;
  rotSpd = PI/180;
  fill(0, 175, 175);
  noStroke();
}

void draw() {
  background(255, 127, 0);
  
  pushMatrix();
  translate(x, y);
  rotate(theta);
  rect(-w/2, -w/2, w, w);
  popMatrix();

  x += spdX;
  y += spdY;
  theta += rotSpd;
 
  // check for wall collisions
  collide();
}

void collide() {
  // calculate dynamicRadius for more
  // accurate wall collisions
  cornerRadiusOffset = w/2/cos(PI/4) - w/2; //calcuate difference between corner and side
  dynamicRadius = abs(sin(collisionTheta)*cornerRadiusOffset);
  
  /*if (int(degrees(collisionTheta))%5==0){
    println("collisionTheta = " + int(degrees(collisionTheta)) + " : dynamicRadius = "+ int(dynamicRadius));
  }*/
  
  if (x > width-w/2-dynamicRadius) {
    spdX *= -1;
    rotSpd *= -1;
  } 
  else if (x < w/2+dynamicRadius) {
    spdX *= -1;
    rotSpd *= -1;
  }
  if (y > height-w/2-dynamicRadius) {
    spdY *= -1;
    rotSpd *= -1;
  } 
  else if (y < w/2+dynamicRadius) {
    spdY *= -1;
    rotSpd *= -1;
  }
 
  // used to calculate dynamicRadius
  collisionTheta += rotSpd*2;
} // end collide

