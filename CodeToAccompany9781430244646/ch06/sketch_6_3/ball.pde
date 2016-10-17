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

class ball {    // Define the ball class
  // Attributes
  PVector location;  // ball's location
  color ballColor;     // its color
  float radius;          // its radius in pixels
  PVector speed;    // dx and dy
  box b;                    // ball is inside Box, b

  ball(box b) {    // Default Constructor
    this(random(width), random(height), 25, color(255, 0, 0), b);
  } // ball()
  ball(float x, float y, float r, color c, box _b ) {
    location = new PVector(x, y); // set up ball with position (x, y), radius r, color c
    radius = r;        // radius, r pixels
    ballColor = c;  // color, c
    // speed at which the ball travels
    speed = new PVector(random(1, 3), random(1, 3));
    // Its enclosing box
    b = _b;
  } // ball()
  // Behaviors...
  void display() {
    // display the ball
    // set color attributes
    noStroke();
    fill(ballColor);
    // draw the ball
    ellipse(location.x, location.y, 2*radius, 2*radius);
  } // display()

void move() {
    location.add(speed);
    bounce();
  } // move()
  void bounce() {
    if (location.x > (b.w-radius)) { // bounce against the right edge
      location.x = b.h-radius;
      speed.x = -speed.x;
    }
    if (location.x < radius) { // bounce against the left edge
      location.x = radius;
      speed.x = -speed.x;
    }
    if (location.y > (b.h-radius)) { // bounce against the bottm edge
      location.y = b.h-radius;
      speed.y = -speed.y;
    }
    if (location.y < radius) { // bounce against the top edge
      location.y = radius;
      speed.y = -speed.y;
    }
  } // bounce()

} // class ball

