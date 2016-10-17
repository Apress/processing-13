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

// Sketch 7-1: Parsing an input text file
String inputTextFile = "Obama.txt";
String [] fileContents;
String rawText;
String tokens[];
String delimiters = " ,./?<>;:'\"[{]}\\|=+-_()*&^%$#@!~";
// Input and parse text file
fileContents = loadStrings(inputTextFile);
rawText = join(fileContents, " ");
rawText = rawText.toLowerCase();
tokens = splitTokens(rawText, delimiters);
// print out the list of tokens
println(tokens.length+" tokens found in file: "+inputTextFile);
for (int i=0; i < 50 ; i++) {
  println(tokens[i]);
}
