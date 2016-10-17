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

// Sketch 7-5: Displaying Simple Text
String sentence = "A man, a plan, a canal, Panama.";

void setup() {
  size(400, 100);
  smooth();
} // setup()

void draw() {
  background(200);
  fill(0);
  textSize(24);
  text(sentence, 10, height/2);
} // draw()

void mouseClicked(){
  save("Figure7-1.tif");
}
