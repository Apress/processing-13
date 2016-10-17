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
// ragged.pde, chapter 9
// Demonstration of ragged arrays

void setup() {
  float[][] ragged = new float[20][];

  for (int i=0; i<ragged.length; i++) {
    int len = randInt(1, 100);
    ragged[i] = new float[len];
  }

  for (int i=0; i<ragged.length; i++) {
    println(ragged[i].length);
  }
}  // end setup()

int randInt(int low, int high) {
  int r =  floor(random(low, high+1));
  r = constrain(r, low, high);
  return r;
} // end randInt()

