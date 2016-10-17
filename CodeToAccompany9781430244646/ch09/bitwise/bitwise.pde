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
// bitwise.pde, chapter 9
// test code for bitwise operators

void setup() {
  color lime = color(0, 255, 0);
  println(binary(lime));
  println(binary(~lime));

  color coralTransparent = color(255, 127, 80, 51);
  println(binary(coralTransparent));
  println(binary(coralTransparent>>8));
  println(binary(coralTransparent>>8 & 0xFF));
  coralTransparent = coralTransparent & ~0x00FF0000 | 0x00AB0000;
  coralTransparent = coralTransparent & ~(0xFF << 16) | (0xAB << 16);
  coralTransparent = coralTransparent & ~(0xFF << 16) | 171 << 16;
  println(binary(coralTransparent));
  println(red(coralTransparent));
  println(green(coralTransparent));
  println(blue(coralTransparent));
  println(alpha(coralTransparent));
  
  color purple = color(255, 0, 255);
  println(binary(purple));		
  color fuchsia = purple & ~0x80;
  println(binary(fuchsia));
  fill(fuchsia);
  rect(0, 0, 50, 50);		
  color red = purple & ~0xFF;	
  println(binary(red));
  fill(red);
  rect(50, 0, 50, 50);	

  color white = ~0;
  println(binary(0x80));
  println(binary(white & ~0xFF | 224));
  color lightYellow = white & ~0xFF | 224;
  fill(lightYellow);
  rect(0, 50, 50, 50);
}

