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
// local_variable_scope.pde, chapter 3
// Variable scope example.

void setup() {
  int locVar1 = 3;
  println("locVar1 in setup = " + locVar1);

  // nested empty block as an example
  {
    println("locVar1 nested in setup = " + locVar1);

    int locVar2 = 290;
    println("locVar2 nested in setup = " + locVar2);
  }

  // uncommented this will generate an error
  // println("local locVar2 out of scope = " + locVar2);
}

void myFunction() {
  // uncommented these will both generate errors
  // println("local locVar1 out of scope = " + locVar1);
  // println("local locVar2 out of scope = " + locVar2);
}

