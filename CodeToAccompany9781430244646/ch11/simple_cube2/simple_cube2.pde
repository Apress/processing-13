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
// simple_cube2.pde, chapter 11
// Processing's box() example 2.

size(600, 600, P3D);
strokeWeight(6);
translate(width/2, height/2);
rotateY(PI/4);
rotateX(PI/4);
box(240);

