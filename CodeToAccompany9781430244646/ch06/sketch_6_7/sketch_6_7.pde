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

// Sketch 6-7: Several widgets

widget [] pieces;
int N = 10;
void setup() {
  size(500, 500);
  smooth();
  pieces = new widget[N];
  for (int i=0; i < N; i++) {
    color c = color(random(50, 200), random(50, 200), random(50, 200));
    switch (int(random(2))) {
    case 0:   
      pieces[i] = new disc(new PVector(random(width), random(height)), 20, c);
      break;
    default: 
      pieces[i] = new hexagon(new PVector(width/2, height/2), 40, c);
    }
  }
} // setup()
void draw() {
  background(255);
  for (int i=0; i < N; i++) {
    pieces[i].move();
    pieces[i].display();
  }
} // draw()

