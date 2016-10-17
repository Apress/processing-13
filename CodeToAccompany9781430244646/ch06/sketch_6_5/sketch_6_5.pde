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

// Sketch 6-5: ball and stick chain

ball [] balls;
stick [] sticks;
int stickLen = 80;
int nBalls = 10;
int nSticks = nBalls - 1;
void setup() {
  size(400, 400);
  smooth();
  // Allocate the ball and stick arrays
  balls = new ball[nBalls];
  sticks = new stick[nSticks];
  // create the balls and sticks and link them up
  for (int i=0; i < nBalls; i++) {
    //PVector p = new PVector(width/2+stickLen*i, height/2);
    balls[i] = new ball(width/2+stickLen*i, height/2, 10, color(0));
    if (i > 0) {
      sticks[i-1] = new stick(balls[i-1], balls[i]);
    }
  }
} // setup()
void draw() {
  background(255);
  // Animate
  for (int i=0; i < nSticks; i++) {
    sticks[i].update();
    sticks[i].display();
  }
} // draw()

