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

class stick {
  ball b1, b2;  // the two balls
  float r;      // the length of the stick
  stick(ball b1, ball b2) {
    this.b1 = b1;
    this.b2 = b2;
    // Compute the length of the stick
    // Same as the initial distance between the two balls
    r = b1.location.dist(b2.location);
  } //stick
  void display() {
    // first display the balls
    b1.display();
    b2.display();
   // display the stick
    stroke(255, 0, 0);
    strokeWeight(5);
    line(b1.location.x, b1.location.y, b2.location.x, b2.location.y);
  } // display()

  void update() {
    b1.move();
    b2.move();
    constrainLength();
  } // update()
  
    void constrainLength(){
    float k = 0.1 ;
    PVector delta = PVector.sub(b2.location, b1.location);
    float deltaLength = delta.mag();
    float d = ((deltaLength - r) / deltaLength);
    b1.location.x += delta.x * k * d/2;
    b1.location.y += delta.y * k * d/2;
    b2.location.x -= delta.x * k * d/2;
    b2.location.y -= delta.y * k * d/2;
  } // constrainLength

} // class stick

