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
// arcs_example.pde, chapter 2
// Creates a page of randomized arcs.

PFont font;

void setup() {
  size(1000, 1000);
  background(255);
  fill(0);
  font = createFont("ArialMT-48.vlw", 20);
  textFont(font, 18);
  int cols = 4; 
  int rows = 4;

  float cellW = width/cols;
  float cellH = height/rows;


  for (int i=0; i<rows; i++) {
    for (int j=0; j<cols; j++) {
      makeArc(cellW/2+cellW*j, cellH/2+cellH*i, cellW*.5, cellH*.5, random(PI), random(PI, TWO_PI));
    }
  }
}

void makeArc(float x, float y, float w, float h, float t1, float t2) {
  arc(x, y, w, h, t1, t2);
  text("start = " + int(degrees(t1)) + " degs", x-w/2, y+h*.75);
  text("end = " + int(degrees(t2)) + " degs", x-w/2, y+h*.925);
}

