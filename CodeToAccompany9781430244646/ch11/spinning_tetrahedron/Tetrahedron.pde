class Tetrahedron {
  // Tetrahedron coords from:
  // http://www.csee.umbc.edu/~squire/reference/polyhedra.shtml#tetrahedron
  float r;
  // Tetrahedron
  PVector[] verts = {
    new PVector(0, 0, 1), // back
    new PVector(.943, 0, -.333), // right
    new PVector(-.471, -.816, -.333), // left-top
    new PVector(-.471, .816, -.333) // left-bottom
    };

  Tuple[] inds = { 
    // wind counter-clockwise (right-hand rule)
    new Tuple(0, 1, 3), 
    new Tuple(0, 3, 2), 
    new Tuple(0, 2, 1), 
    new Tuple(1, 2, 3)
    };

    Face[] faces = new Face[4];

  Tetrahedron(float r) {
    this.r = r;
    for (int i=0; i<4; i++) {
      faces[i] = new Face(verts[inds[i].elem0], verts[inds[i].elem1], verts[inds[i].elem2]);
    }
  }

  void display() {
    pushMatrix();
    scale(r);
    for (int i=0; i<4; i++) {
      faces[i].display();
    }
    popMatrix();
  }
}




