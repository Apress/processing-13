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

// Sketch 6-4: Two balls and a stick

class ball {    // Define the ball class
  // Attributes
  PVector location;  // ball's location
  color ballColor;     // its color
  float radius;          // its radius in pixels
  PVector speed;    // dx and dy

  ball() {    // Default Constructor
    this(random(width), random(height), 10, color(255, 0, 0));
  } // ball()

  ball(float x, float y, float r, color c) {
    location = new PVector(x, y); // set up ball with position (x, y), radius r, color c
    radius = r;        // radius, r pixels
    ballColor = c;  // color, c
    // speed at which the ball travels
    speed = new PVector(random(1, 3), random(1, 3));
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
    if (location.x > (width-radius)) { // bounce against the right edge
      location.x = width-radius;
      speed.x = -speed.x;
    }
    if (location.x < radius) { // bounce against the left edge
      location.x = radius;
      speed.x = -speed.x;
    }
    if (location.y > (height-radius)) { // bounce against the bottm edge
      location.y = height-radius;
      speed.y = -speed.y;
    }
    if (location.y < radius) { // bounce against the top edge
      location.y = radius;
      speed.y = -speed.y;
    }
  } // bounce()

} // class ball

