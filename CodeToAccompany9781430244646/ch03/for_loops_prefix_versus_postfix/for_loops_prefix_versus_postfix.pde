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
// for_loops_prefix_versus_postfix.pde, chapter 3

for (int a=0; a<3; a++) {
  println("a = " + a);
}

for (int b=0; b<3; ++b) {
  println("b = " + b);
}

