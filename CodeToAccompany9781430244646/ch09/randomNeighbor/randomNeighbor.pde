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
// randomNeighbor.pde, chapter 9
// Replacing every pixel with one of its 8 neighbors and itself

PImage img;

void setup() {
  img = loadImage("fall.jpg");
  size(img.width, img.height);
  image(img, 0, 0);
} // end setup()

void draw() {
  for (int y=1; y<img.height-1; y++) {
    for (int x=1; x<img.width-1; x++) {
      int newX = randInt(x-1, x+1);
      int newY = randInt(y-1, y+1);
      set(x, y, get(newX, newY));
    }
  }
} // end draw()

// returns a randomly generated integer between low and high, including low and high
int randInt(int low, int high) {
  int r =  floor(random(low, high+1));
  //Processing's random(low, high) occasionally returns high,
  //even though the references say it doesn't
  r = constrain(r, low, high);
  return r;
} // end randInt()

