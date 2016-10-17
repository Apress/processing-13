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

// Sketch 7-6: isplayingText in a Specific Font
String sentence = "A man, a plan, a canal, Panama.";
PFont tnr;
void setup() {
  size(400, 100);
  smooth();
  //tnr = createFont("Times New  Roman", 48);
  tnr = loadFont("TimesNewRomanPSMT-48.vlw");
  println(PFont.list());
} // setup()
void draw() {
  background(200);
  fill(0);
  textFont(tnr);
  textSize(24);
  text(sentence, 10, height/2);
} // draw()

void mouseClicked(){
  save("978-1-4302-4464-6_kumar_Ch07_Figure7-2.tif");
}
