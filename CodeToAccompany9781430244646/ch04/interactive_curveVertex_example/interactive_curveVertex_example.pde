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
// interactive_curveVertex_example.pde, chapter 4
// Interactively manipulate spline curve
// including changing curve tension.

float ax0, ay0, ax1, ay1, ax2, ay2, ax3, ay3, ax4, ay4;
boolean isOnAnchor0, isOnAnchor1, isOnAnchor2, isOnAnchor3, isOnAnchor4;
float radius = 5;

// gui to control curvature
float curvature = 0;
float sliderBarX, sliderBarY, sliderBarW;
float sliderHandleX, sliderHandleY, sliderHandleW = 12;
float sliderMin = -3, sliderMax = 3;
boolean isOnSliderHandle;

void setup() {
  size(600, 600);
  background(255);

  ax0 = random(100, width-100);
  ax1 = random(100, width-100);
  ax2 = random(100, width-100);
  ax3 = random(100, width-100);
  ax4 = random(100, width-100);

  ay0 = random(100, height-100);
  ay1 = random(100, height-100);
  ay2 = random(100, height-100);
  ay3 = random(100, height-100);
  ay4 = random(100, height-100);

  // control bar for intractive curvature
  sliderBarW = width/3;
  sliderBarX = width-sliderBarW-40; 
  sliderBarY = height-40;
  sliderHandleX = sliderBarX + sliderBarW/2;
  sliderHandleY = sliderBarY;
}

void draw() {
  background(255);
  noFill();
  strokeWeight(4);
  stroke(0);

  curveTightness(curvature);
  // draw curve
  beginShape();
  curveVertex(ax0, ay0); // double inital point
  curveVertex(ax0, ay0);
  curveVertex(ax1, ay1);
  curveVertex(ax2, ay2);
  curveVertex(ax3, ay3);
  curveVertex(ax4, ay4);
  curveVertex(ax4, ay4); // double final point
  endShape();

  // draw control/anchor points
  strokeWeight(1);
  fill(255, 127, 0);
  ellipse(ax0, ay0, radius*2, radius*2);
  ellipse(ax1, ay1, radius*2, radius*2);
  ellipse(ax2, ay2, radius*2, radius*2);
  ellipse(ax3, ay3, radius*2, radius*2);
  ellipse(ax4, ay4, radius*2, radius*2);


  // detect if mouse is on control/anchor point
  if (dist(mouseX, mouseY, ax0, ay0) < radius) {
    isOnAnchor0 = true;
  } 
  else if (dist(mouseX, mouseY, ax1, ay1) < radius) {
    isOnAnchor1 = true;
  } 
  else if (dist(mouseX, mouseY, ax2, ay2) < radius) {
    isOnAnchor2 = true;
  } 
  else if (dist(mouseX, mouseY, ax3, ay3) < radius) {
    isOnAnchor3 = true;
  } 
  else if (dist(mouseX, mouseY, ax4, ay4) < radius) {
    isOnAnchor4 = true;
  }

  // ensure boolean flags set back to false when mouse released
  if (!mousePressed) {
    isOnAnchor0 = isOnAnchor1 = isOnAnchor2 = isOnAnchor3 = isOnAnchor4 = isOnSliderHandle = false;
  }

  // interactively control curvature
  setCurvatureControlGUI();
} // END draw()

void setCurvatureControlGUI() {

  line(sliderBarX, sliderBarY, sliderBarX+sliderBarW, sliderBarY);
  fill(0, 0, 255);
  rect(sliderHandleX-sliderHandleW/2, sliderHandleY-sliderHandleW/2, sliderHandleW, sliderHandleW);

  if (isOnSliderHandle &&  mouseX>sliderBarX && mouseX < sliderBarX + sliderBarW) {
    sliderHandleX = mouseX;
  }
  // detect if mouse is on control/anchor point
  if (dist(mouseX, mouseY, sliderHandleX, sliderHandleY) < sliderHandleW/2) {
    isOnSliderHandle = true;
  }

  // ensures slider handle values between to sliderMin to sliderMax
  curvature = map(sliderHandleX, sliderBarX, sliderBarX+sliderBarW, sliderMin, sliderMax);
} // END setCurvature()

void mouseDragged() {
  // move points
  if (isOnAnchor0) {
    ax0 = mouseX;
    ay0 = mouseY;
  } 
  else if (isOnAnchor1) {
    ax1 = mouseX;
    ay1 = mouseY;
  } 
  else if (isOnAnchor2) {
    ax2 = mouseX;
    ay2 = mouseY;
  } 
  else if (isOnAnchor3) {
    ax3 = mouseX;
    ay3 = mouseY;
  } 
  else if (isOnAnchor4) {
    ax4 = mouseX;
    ay4 = mouseY;
  }
} // END mouseDragged()

