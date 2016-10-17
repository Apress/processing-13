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
//Lsystem.pde, chapter 8
//Implementation of a basic L-system

void setup() {
  size(800, 800, P2D);
  background(255);

  // each block is an individual L-system including initialization and rendering commands
  // try uncommenting and testing the blocks one by one 

  Lsys plant = new Lsys();
  plant.setAxiom("X");
  plant.addRule("XF-[[X]+X]+F[+FX]-X");
  plant.addRule("FFF");
  plant.genString(6);
  color green = color(90, 127, 51);
  gradientBg(green);
  stroke(green);
  translate(100, height);
  rotate(radians(110));
  scale(-1, 1);
  plant.render(5, 22.5);

  /*
  Lsys kochCurve = new Lsys();
  kochCurve.setAxiom("F");
  kochCurve.addRule("FF+F-F-F+F");
  kochCurve.genString(3);
  translate(10, height/2);
  kochCurve.render(25, 90);
  */

  /*
  Lsys kochSnowFlake = new Lsys();
  kochSnowFlake.setAxiom("F++F++F");
  kochSnowFlake.addRule("FF-F++F-F");
  kochSnowFlake.genString(3);
  translate(width/8, height*3/4);
  kochSnowFlake.render(20, 60);
  */

  /*
  Lsys dragon = new Lsys();
  dragon.setAxiom("FX");
  dragon.addRule("XX+YF+");
  dragon.addRule("Y-FX-Y");
  dragon.genString(14);
  translate(width*3/4, height/2);
  rotate(radians(90));
  dragon.render(4, 90);
  */

  /*
  Lsys quadricFlake = new Lsys();
  quadricFlake.setAxiom("F+F+F+F");
  quadricFlake.addRule("FF+F-F-FF+F+F-F");
  quadricFlake.genString(3);
  translate(width/4, height*3/4);
  quadricFlake.render(5, 90);
  */

  /*
  Lsys twig = new Lsys();
  twig.setAxiom("F");
  twig.addRule("FF[-F]F[+F]F");
  twig.genString(3);
  translate(width/2, height);
  rotate(radians(-90));
  strokeWeight(2);
  twig.render(25, 27);
  */
} // end setup()

// draws a gradient background between a lighter version of the given color c 
// (+50 on each channel); this is so that c would stand out as stroke color 
// and off-white (225, 225, 225)
void gradientBg(color c) {
  loadPixels();
  for (int x=0; x<width; x++)
    for (int y=0; y<height; y++) {
      float r = map(height-y, height-1, 0, 225, red(c)+50);
      float g = map(height-y, height-1, 0, 225, green(c)+50);
      float b = map(height-y, height-1, 0, 225, blue(c)+50);
      pixels[y*width+x] = color(r, g, b);
    }
  updatePixels();
} // end gradientBg()

