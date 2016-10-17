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
// factorial.pde, chapter 8
// Compute factorial of a non-negative integer 
// Recursive implementation

void setup() {
  int n = 5;
  int f = factorial(n);
  println(f);
  fill(0);
  text(n+"! = "+f, 0, height/2);
}

int factorial(int n) {
  if (n == 0) {
    return 1;
  } 
  else {
    return n*factorial(n-1);
  }
} 

