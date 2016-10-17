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
// java_mode_example.pde, chapter 11
// Example using a Java class inside Processing.

PClass pc;

public void setup() {
  size(400, 400);
  background(0);
  translate(width/2, height/2);
  pc = new PClass(this, 200);
}

