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

class disc extends widget  {
  // A disc is a circular shape
  float r;
  PVector speed;  
  disc() {
    this(new PVector(random(width), random(height)), 30, color(0));
  } // disc()
  disc(PVector loc, float s, color c) {
    super(loc, s, c);
    r = sz/2;
    speed = new PVector(random(1, 3), random(1, 3));
  } // disc()
  void display() {
    noStroke();
    fill(col);
    ellipse(location.x, location.y, sz, sz);
  } // display()
  void setSpeed(PVector s) {
    speed = s;
  } // setSpeed()  
  void move() {
    location.add(speed);
    bounce();
  } // move()  
  void bounce() {
    if (location.x > (width-r)) { // bounce against the right edge
      location.x = width-r;
      speed.x = -speed.x;
    }
    if (location.x < r) { // bounce against the left edge
      location.x = r;
      speed.x = -speed.x;
    }
    if (location.y > (height-r)) { // bounce against the bottm edge
      location.y = height-r;
      speed.y = -speed.y;
    }
    if (location.y < r) { // bounce against the top edge
      location.y = r;
      speed.y = -speed.y;
    }
  } // bounce()  
} // class disc

