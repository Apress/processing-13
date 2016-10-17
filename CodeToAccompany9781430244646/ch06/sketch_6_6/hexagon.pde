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

// Sketch 6-6: widgets, discs, and hexagons

class hexagon extends widget {

  int nSides = 6;
  float r;
  float rot;
  PVector speed;

  hexagon() {
    this(new PVector(random(width), random(height)), 30, color(0));
  } // hexagon()

  hexagon(PVector loc, float s, color c) {
    super(loc, s, c);
    r = sz/2;
    rot = 0;
    speed = new PVector(random(-2, 2), random(-2, 2));
  } // hexagon()
  void setSpeed(PVector s) {
    s.mult(-2);
    speed = s;
  } // setSpeed()

  void display() {

    float x1, y1;
    float theta = rot;

    noStroke();
    fill(col);

    beginShape();

    for (int i = 0; i <nSides; i++) {
      x1 = location.x + r*cos(theta);
      y1 = location.y + r*sin(theta);
      vertex(x1, y1);
      theta += PI/3;
    }
    endShape(CLOSE);
  }// display

  void move() {

    rot += 0.01;
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
//
//  boolean clicked() {
//    PVector m = new PVector(mouseX, mouseY);
//    return (PVector.dist(location, m) < r);
//  } //clicked()
} // class hexagon

