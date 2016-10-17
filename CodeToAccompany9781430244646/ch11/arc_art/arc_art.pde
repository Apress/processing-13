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
// arc_art.pde, chapter 11
// Example using ArcSpiral.pde class.

ArcSpiral as;

void setup() {
  size(600, 600);
  as = new ArcSpiral(900, 80);
}

void draw() {
  noStroke();
  fill(0, 1);
  rect(-1, -1, width+1, height+1);
  strokeWeight(13);
  translate(width/2, height/2);
  rotate(frameCount*PI/360);
  as.display();
}

//Processing inner class
class ArcSpiral {

  float r;
  int arcCount;

  ArcSpiral() {
  }

  ArcSpiral(float r, int arcCount) { 
    this.r = r;
    this.arcCount = arcCount;
  }

  void display() {
    float r2 = r;
    float theta = 0;
    fill(255-abs(sin(frameCount*PI/1440)*255));
    stroke(abs(sin(frameCount*PI/1440)*255));
    for (int i=0; i<arcCount*2; i++) {
      arc(0, 0, r2, r2, theta, theta+TWO_PI/arcCount, CHORD);
      theta += TWO_PI/arcCount;
      r2 -= width/arcCount;
    }
  }
}

