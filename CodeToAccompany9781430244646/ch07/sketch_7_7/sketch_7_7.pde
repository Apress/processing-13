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

// Skjetch 7-7: List of fonts
String[] fonts;
PFont font;
int N, i;
void setup() {
  size(500, 500);
  background(255);
  fonts =  PFont.list();
  N = fonts.length;
  i = 0;  
  println("There are "+N+" fonts installed.");
} // setup()

void mousePressed() {
  font = createFont(fonts[i], 24);
  textFont(font);
  fill(0);
  text(fonts[i], mouseX, mouseY);
  i++;
} // mousePressed()

