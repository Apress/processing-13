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
// noise.pde, chapter 9
// Visualization of 2D perlin noise in a variety of shapes

import processing.opengl.*;

float[][] data = new float[500][500];
void setup() {
  size(data.length, data[0].length, OPENGL);
  smooth();
  genNoise(data);
  //comment and uncomment each of these functions and see what happens!
  //asPoint(data);
  asSquareColor(data);
  //asSquare3D(data);
  //asRotation(data);
} // end setup()

void genNoise(float[][] data) {
  float noiseScale=0.015;
  noiseDetail(2, 0.5);
  for (int i=0; i < data.length; i++) {
    for (int j=0; j< data[i].length; j++) {
      data[i][j] = noise(j*noiseScale, i*noiseScale);
    }
  }
} // end genNoise()

void asPoint(float[][] data) {
  background(0);
  for (int i = 0; i < data.length; i++) {
    for (int j = 0; j < data[i].length; j++) {
      //stroke(data[i][j]*255); // grayscale colors
      stroke(0, 255*data[i][j], 255-255*data[i][j]); //blue to green colors
      ellipse(j, i, 1, 1);
    }
  }
} // end asPoint()

void asSquare3D(float[][] data) {
  int s = 10;
  background(0);
  for (int i = 0; i < data.length; i+=s) {
    for (int j = 0; j < data[i].length; j+=s) {
      strokeWeight(2);
      stroke(data[i][j]*255);
      noFill();
      pushMatrix();
      translate(j, i, data[i][j]*s*2);
      // the larger data[i][j] is, the closer the square is drawn to screen
      rect(0, 0, data[i][j]*s, data[i][j]*s);
      popMatrix();
    }
  }
} // end asSquare3D()

void asSquareColor(float[][] data) {
  int s = 10;
  background(0);
  for (int i = 0; i < data.length; i+=s) {
    for (int j = 0; j < data[i].length; j+=s) {
      stroke(255, data[i][j]*255, 0); //orange
      //stroke(data[i][j]*255, 200, 25); //green variaion
      //stroke(0, data[i][j]*255, 255); //blue variation
      strokeWeight(2);
      noFill();
      pushMatrix();
      translate(j, i);
      rect(0, 0, data[i][j]*s*2, data[i][j]*s*2);
      popMatrix();
    }
  }
} // end asSquareColor()

void asRotation(float[][] data) {
  int s = 5;
  background(0);
  for (int i = 0; i < data.length; i+=s) {
    for (int j = 0; j < data[i].length; j+=s) {
      stroke(255, 50);
      strokeWeight(2);
      pushMatrix();
      translate(j, i);
      // the larger data[i][j] is, the closer to 2PI we rotate
      rotate(data[i][j]*PI*2);
      line(0, 0, s*4, 0);
      popMatrix();
    }
  }
} // end asRotation()
