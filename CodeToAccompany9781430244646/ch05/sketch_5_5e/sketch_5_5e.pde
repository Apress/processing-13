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

// Sketch 5-5e: Visualizing Time Series (AAPL Stock prices)
float[] price;
float minPrice, maxPrice;

int[] mm;

float X1, Y1, X2, Y2;

PFont legendFont = createFont("SansSerif", 20);

void setup() {

  // drawing setup
  size(600, 400);

  X1 = 50; 
  Y1 = 50;
  X2 = width - 50; 
  Y2 = height - Y1;

  smooth();
  textFont(legendFont);

  // Read the data file...
  String[] lines = loadStrings("AAPLStock.txt");

  // How long is the dataset
  price = new float[lines.length];
  mm = new int[lines.length];

  // Parse the needed data
  for (int i=0; i<lines.length; i++) {
    // Frst split each line using commas as separator
    String[] pieces = split(lines[i], ",");

    // get the closing price of stock, and month
    price[i] = float(pieces[5]);
    mm[i] = int(pieces[0]);
  }
  println("Data Loaded: "+price.length+" entries.");

  // determine min and max stock price for the year
  minPrice = min(price);
  maxPrice = max(price);
  println("Min: "+minPrice);
  println("Max: "+maxPrice);
} // setup()

void draw() {
  background(0);

  // draw plot bounding box
  rectMode(CORNERS);
  noStroke();
  fill(255);
  rect(X1, Y1, X2, Y2);

  drawGraph(price, minPrice, maxPrice);
  movingAverage(price, minPrice, maxPrice, 25);
  // draw legend
  // title
  fill(255);
  textSize(18);
  textAlign(LEFT);
  text("(AAPL) Apple Inc. 2010", X1, Y1 - 10);
  textSize(10);
  textAlign(RIGHT, BOTTOM);
  text("Source: Yahoo! Finance (finance.yahoo.com)", width-10, height-10);

  // axis labels
  drawXLabels();
  drawYLabels();
} // draw()

void drawGraph(float[] data, float yMin, float yMax) {
  stroke(0);
  strokeWeight(1);
  beginShape();
  for (int i=0; i < data.length; i++) {
    float x = map(i, 0, data.length-1, X1, X2);
    float y = map(data[i], yMin, yMax, Y2, Y1);
    vertex(x, y);
  }
  endShape();
} // drawGraph()

void movingAverage(float[] data, float yMin, float yMax, int MAP) {
  noFill();
  stroke(255, 0, 0);
  strokeWeight(2);

  beginShape();
  for (int i=MAP-1; i < data.length; i++) {
    float sum = 0;
    for (int k=i-(MAP-1); k <= i; k++) {
      sum += data[k];
    }
    float MA = sum/MAP;
    float x = map(i, 0, data.length-1, X1, X2);
    float y = map(MA, yMin, yMax, Y2, Y1);
    vertex(x, y);
  }
  endShape();
} //movingAverage()

void drawYLabels () {
  fill(255);
  textSize(10);
  textAlign(RIGHT);
  stroke(255);
  for (float i=minPrice; i <= maxPrice; i += 10) {
    float y = map(i, minPrice, maxPrice, Y2, Y1);
    text(floor(i), X1-10, y);
    line(X1, y, X1-5, y);
  }
  textSize(18);
  text("$", X1-40, height/2);
} // drawYLabels()

void drawXLabels() {
  fill(255);
  stroke(0);
  textSize(10);
  textAlign(CENTER);

  int m = 0;
  for (int i=0; i<mm.length; i++) {
    if (mm[i] == m) continue;
    m = mm[i];
    float x = map(i, 0, mm.length, X1, X2);
    text(m, x, Y2+10);
    strokeWeight(0.3);
    line(x, Y2, x, Y1);
  }
  textSize(18);
  textAlign(CENTER, TOP);
  text("Month", width/2, Y2+10);
} // drawXLabels()

void mouseClicked() {
  save("KumarAppleChart.jpg");
}

