/*
Copyright (c) 2013, Friends of Ed (An Apress Company)
All rights reserved.

The code provided here accompanies the book:

Processing: Creative Coding and Generative Art in Processing 2
By Ira Greenberg, Dianna Xu, and Deepak Kumar
Friends of Ed (An APress Company), 2013
ISBN-13 978-1430244646

*/

// Sketch: 6-2: File ball.pde
class ball {    // Define the ball class
  // Attributes
  float x, y;          // the x and y location
  color ballColor;     // its color
  float radius;        // its radius in pixels  

    float speed = 5.0;      // The speed at which the ball is moving
  float gravity = 0.1;    // the rate of increase of speed
  float dx = 1;           // amount of lateral movement
  float dampen = -0.9;    // amount of dampening after each bounce

  // Constructors
  // Default Constructor
  ball() {
    this(random(width), random(height), 25.0, color(255, 0, 0));
  } // Ball() 

  ball(float x, float y, float r, color c) {
    // set up ball with position (x, y)
    this.x = x;
    this.y = y;    
    // size, r pixels
    radius = r;    
    // color, c
    ballColor = c;
  } // ball()

  ball(float r, color c) {
    this(random(width), random(height), r, c);
  } // ball()

  // Behaviors
  void display() {
    // display the ball
    // set color attributes
    noStroke();
    fill(ballColor);
    // draw the ball
    ellipse(x, y, 2*radius, 2*radius);
  } // display()

  void move() {    
    x = x + dx;
    y = y + speed;
    speed = speed + gravity;    
    // check to see if it bounces
    bounce();
  } //move()

  void bounce() {
    if (x > (width-radius)) {   // bounce against the right edge
      x = width-radius;
      dx = -dx;
    }
    if (x < radius) {   // bounce against the left edge
      x = radius;
      dx = -dx;
    }
    if (y > (height-radius)) {   // bounce against the bottom edge
      y = height-radius;
      speed = speed * dampen ;
    }
  } // bounce()
} // class ball

