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

// Sketch5-3: Bar Graph using a barGraph() function
String[] energySource = {
  "Petroleum", "Coal", "Natural Gas", "Nuclear", "Renewable", "Hydropower"
};
float[] consumption = {
  40.0, 23.0, 22.0, 8.0, 4.0, 3.0
};
void setup() {
  size(400, 400);
  smooth();
} // setup()
void draw() {
  background(255);
  barGraph();
} // draw()
void barGraph() {
  // set up dimensions relative to screen size
  float x = width*0.1;
  float y = height*0.9;
  float delta = width*0.8/consumption.length;
  float w = delta*0.8;
  for (int i=0; i < consumption.length; i++) {
    // draw the bar for ith data value
    // first compute the height of the bar relative to sketch window
    float h = map(consumption[i], 0, 100, 0, height);
    fill(0);
    rect(x, y-h, w, h);
    x = x + delta;
  }
} // barGraph()

