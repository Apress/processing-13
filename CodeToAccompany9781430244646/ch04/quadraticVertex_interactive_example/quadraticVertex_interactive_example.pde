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
// quadraticVertex_interactive_example.pde, chapter 4
// Interactive quadratic curve.

float ax, ay, cx, cy;
boolean isOnControl, isOnAnchor;
float radius = 5;

void setup() {
  size(600, 600);
  cx = random(100, width-100);
  cy = random(100, height-100);
  ax =random(100, width-100);
  ay =  random(100, height-100);
}

void draw() {
  background(255);
  noFill();
  strokeWeight(4);
  stroke(0);

  // draw curve
  beginShape();
  vertex(width/2, height/2);
  quadraticVertex(cx, cy, ax, ay);
  endShape();

  // draw center point
  fill(200);
  strokeWeight(1);
  ellipse(width/2, height/2, radius*2, radius*2);

  // draw connecting handle
  line(cx, cy, ax, ay);

  // draw control point
  fill(0, 0, 255);
  rect(cx-radius, cy-radius, radius*2, radius*2);

  // draw anchor point
  fill(255, 127, 0);
  ellipse(ax, ay, radius*2, radius*2);

  // detect if mouse is on control/anchor point
  if (dist(mouseX, mouseY, ax, ay) < radius) {
    isOnAnchor = true;
  } 
  else if (dist(mouseX, mouseY, cx, cy) < radius) {
    isOnControl = true;
  } 
  else {
    isOnAnchor = isOnControl = false;
  }
}

void mouseDragged() {
  // move points
  if (isOnControl) {
    cx = mouseX;
    cy = mouseY;
  } 
  else if (isOnAnchor) {
    ax = mouseX;
    ay = mouseY;
  }
}

