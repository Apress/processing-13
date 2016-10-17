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

// Sketch 6-3: balls in a box

class box {  
  float x, y, w, h;  // top left corner (x, y), width (w), height (h)
  int nBalls;        // # of balls in the box
  int ballRadius = 2;
  ball [] balls;    // place to store all the balls in this box

// Constructor
  box(float x, float y, float w, float h, int n) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.nBalls = n;    
    // Create balls...
    balls = new ball[nBalls];
    for (int i=0; i < balls.length; i++) {
      balls[i] = new ball(w/2, h/2, ballRadius, color(0), this);
    }
  } // box()    
    void display() {
      // draw box
      pushMatrix();
      translate(x, y);
      stroke(0);
      fill(255);
      rect(0, 0, w, h);     
      // draw balls
     for (int i=0; i < balls.length; i++) {
        balls[i].display();
      }
      popMatrix();
    } // display()    
    void update() {
      // move each ball...
      for (int i=0; i < balls.length; i++) {
        balls[i].move();
      }
    } // update
} // class box

