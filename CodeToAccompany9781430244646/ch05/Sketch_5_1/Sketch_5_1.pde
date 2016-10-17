/*------------------------------------------------------------
Copyright (c) 2013, Friends of Ed (An Apress Company)
All rights reserved.

The code provided here accompanies the book:

Processing: Creative Coding and Generative Art in Processing 2
By Ira Greenberg, Dianna Xu, and Deepak Kumar
Friends of Ed (An APress Company), 2013
ISBN-13 978-1430244646
Please refer to the associated README for a full disclaimer.
------------------------------------------------------------*/

// Sketch 5-1: A Simple Bar Graph
String[] energySource = {
  "Petroleum", "Coal", "Natural Gas", 
  "Nuclear", "Renewable", "Hydropower"
};
float[] consumption = {
  40.0, 23.0, 22.0, 8.0, 4.0, 3.0
};

void setup() {
  size(400, 400);
  smooth();
} // setup()

void draw() {

  // set up plot dimensions relative to screen size
  float x = width*0.1;
  float y = height*0.9;
  float delta = width*0.8/consumption.length;
  float w = delta*0.8;

  background(255);

  for (float value : consumption) {
    // draw the bar for ith data value
    // first compute the height of the bar relative to sketch window
    float h = map(value, 0, 100, 0, height); 

    fill(0);
    rect(x, y-h, w, h);
    x = x + delta;
  }
} // draw()

