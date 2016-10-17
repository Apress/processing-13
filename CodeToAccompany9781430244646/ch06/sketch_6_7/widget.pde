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

abstract class widget {
  // Every shape has a x-, y- location, size, and color
  PVector location;
  float sz;
  color col;  
  widget() {
    this(new PVector(random(width), random(height)), 30, color(0));
  } // widget()
  
  widget(PVector loc, float s, color c) {
    location = loc;
    sz = s;
    col = c;
  } // widget()  
  // Every shape can be displayed
  abstract void display();  
  // Every shape can move
  abstract void move(); 
  // Set the speed at which the widget moves    
  abstract void setSpeed(PVector s);
} // class widget
