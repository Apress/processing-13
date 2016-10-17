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
// factorial.pde, chapter 4
// Function return example.

void setup() {
  int input = 6;
  int f = getFactorial(input);
  println("The factorial of " + input + " = " + f);
  // or
  println("The factorial of " + input + " = " + getFactorial(input));
}
int getFactorial(int val) {
  int fact = 1;
  while (val > 0) {
    fact*=val;
    val--;
  }
  return fact;
}


