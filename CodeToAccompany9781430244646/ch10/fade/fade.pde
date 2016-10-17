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
// fade.pde, Chapter 10
// Fading in and out an array of images

PImage[] img = new PImage[5];
int alpha = 255;
int cur = 0, nxt = 1;

void setup() {
  size(600, 450);     // use the largest dimension from all images
  imageMode(CENTER);
  // Load images, named bmc0.jpg, bmc1.jpg, ... etc
  for (int i=0; i<img.length; i++) {
    img[i] = loadImage("bmc"+i+".jpg");
  }
}// end setup()

void draw() {
  background(255);  
  // Fade out current image
  tint(255, alpha);
  image(img[cur], width/2, height/2);  
  // Fade in next image
  tint(255, 255-alpha);
  image(img[nxt], width/2, height/2);
  alpha--;

  // Swap images when fade complete
  if (alpha < 0) {
    cur = nxt;
    nxt = (cur+1)%img.length;
    alpha = 255;
  }
}// end draw()

