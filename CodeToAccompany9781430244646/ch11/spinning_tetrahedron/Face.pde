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
// Face.pde class

class Face {
  PVector[] vecs = new PVector[3];
  Face(PVector v0, PVector v1, PVector v2) {
    vecs[0]=v0;
    vecs[1]=v1;
    vecs[2]=v2;
  }

  void display() {
    beginShape();
    for (int i=0; i<3; i++) {
      vertex(vecs[i].x, vecs[i].y, vecs[i].z);
    }
    endShape();
  }
}
