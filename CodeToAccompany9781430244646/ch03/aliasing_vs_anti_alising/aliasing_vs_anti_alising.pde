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
// aliasing_vs_anti-aliasing.pde, chapter 3
// compare aliasing versus anti-aliasing (default state)

size(800, 400);
background(255);
noFill();
strokeWeight(2);

// default anti-aliasing 
pushMatrix();
translate(width/4, height/2);
scale(16);
triangle(-10, -10, 10, -10, 0, 10);
popMatrix();

// aliasing
noSmooth();
pushMatrix();
translate(width-width/4, height/2);
scale(16);
triangle(-10, -10, 10, -10, 0, 10);
popMatrix();

// saves screen capture to sketch directory
saveFrame();
