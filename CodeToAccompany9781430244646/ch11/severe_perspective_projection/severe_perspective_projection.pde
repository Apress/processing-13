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
// severe_perspective_projection.pde, chapter 11
// Severe perspective projection examples.

size(600, 200, P3D);
background(0);
noFill();
stroke(255);

pushMatrix();
translate(width/8, height/2, 100);
float fov = PI/1.3;
float cameraZ = (height/2.0) / tan(fov/2.0);
perspective(fov, float(width)/float(height), 
            cameraZ/10.0, cameraZ*10.0);
box(75);
popMatrix();

pushMatrix();
translate(width/2, height/2, 100);
fov = PI/1.3;
perspective(fov, float(width)/float(height), 
            cameraZ/10.0, cameraZ*10.0);
box(75);
popMatrix();

pushMatrix();
translate(width-width/8, height/2, 100);
fov = PI/1.3;
perspective(fov, float(width)/float(height), 
            cameraZ/10.0, cameraZ*10.0);
box(75);
popMatrix();
