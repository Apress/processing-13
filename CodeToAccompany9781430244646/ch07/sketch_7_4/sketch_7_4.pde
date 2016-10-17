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

// Sketch 7-4: Using ArrayLists for word frequencies
//                       And eliminating stop words 
//                       And using the WordFreq class
String inputTextFile = "Obama.txt";
WordFreq table;
void setup() {
  // Input and parse text file
  String [] fileContents = loadStrings(inputTextFile);
  String rawText = join(fileContents, " ").toLowerCase();
  String [] tokens;
  String delimiters = " ,./?<>;:'\"[{]}\\|=+-_()*&^%$#@!~";
  tokens = splitTokens(rawText, delimiters);
  println(tokens.length+" tokens found in file: "+inputTextFile);
  // Create the word frequency table
  table = new WordFreq(tokens);
  table.tabulate();
  println("Max frequency:"+table.maxFreq());
} // setup()
