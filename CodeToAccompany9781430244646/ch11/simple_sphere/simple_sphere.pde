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
// simple_sphere.pde, chapter 11
// Example showcasing Processing's simplified approach to 3D.

size(600, 600, P3D);
background(30, 30, 50);
noStroke();
sphereDetail(170);
ambient(250, 100, 100);
ambientLight(40, 20, 40);
lightSpecular(255, 215, 215);
directionalLight(185, 195, 255, -1, 1.25, -1);
shininess(255);
translate(width/2, height/2);
sphere(160);

