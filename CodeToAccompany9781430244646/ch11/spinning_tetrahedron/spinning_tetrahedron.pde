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
// spinning_tetrahedron.pde, chapter 11
// Custom tetrahedron implementation. The example 
// includes Tuple.pde and Face.pde classes.

Tetrahedron t;
void setup() {
  size(600, 600, P3D);
  t = new Tetrahedron(200);
}

void draw() {
  background(50);
  lights();
  translate(width/2, height/2);
  rotateX(frameCount*PI/275);
  rotateZ(frameCount*PI/175);
  t.display();
}

