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

// Sketch 7-11: Word Cloud Visualization
import processing.opengl.*;
String inputTextFile = "Obama.txt";
WordFreq table;
PFont tnr;	// The font to be used
int N = 150;	// The number of words to be displayed

void setup() {
  // Input and parse text file
  String [] fileContents = loadStrings(inputTextFile);
  String rawText = join(fileContents, " ");
  rawText = rawText.toLowerCase();
  String [] tokens;
  String delimiters = " ,./?<>;:'\"[{]}\\|=+-_()*&^%$#@!~";
  tokens = splitTokens(rawText, delimiters);
  println(tokens.length+" tokens found in file: "+inputTextFile);
  // display stuff
  size(800, 800, OPENGL);
  tnr = createFont("Times New Roman", 120);
  textFont(tnr);
  textSize(24);
  noLoop();  
  // Create the word frequency table
  table = new WordFreq(tokens);
  println("Max frequency:"+table.maxFreq());  
  table.arrange(N);
} // setup()

void draw() {
  background(255);
  table.display(N);
  table.tabulate(N);
} // draw()

// Bonus: The start of building interaction...
void mouseClicked() {
  table.interact(mouseX, mouseY);
} // mouseClicked()
