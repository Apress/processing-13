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
// emergentVoronoi.pde, chapter 9
// A Voronoi diagram drawn with an emergent system.
// Particles move to get further away from the closest site,
// until they are equidistant to two or more.
// Left mouse click releases one new particle at mouse point
// Right mouse click or any key press resets the entire system

PVector[] sites;  // sites
ArrayList ps;     // particles
int numSites = 10;
int numParticles = 5000;

void setup() {
  size(800, 800);
  smooth();
  colorMode(HSB, 360, 100, 100);
  sites = new PVector[numSites];
  reset();
} // end setup()

void draw() {
  background(255);
  // draws the sites
  for (int i=0; i<sites.length; i++) {
    noStroke();
    fill(200);
    ellipse(sites[i].x, sites[i].y, 20, 20);
  }
  // draws the particles
  for (int i=ps.size()-1; i>=0; i--) {
    Particle p = (Particle)ps.get(i);
    p.display();
    if (!p.converge()) {  // if p has not converged
      if (p.update()) {   // move p and if out of screen after moving
        ps.remove(i);     // remove particle from ps
      }
    }
  }
} // end draw()

// creates all new randomly placed sites and particles
void reset() {
  for (int i=0; i<sites.length; i++) {
    sites[i] = new PVector(random(width), random(height));
  }
  ps = new ArrayList();
  for (int i=0; i<numParticles; i++) {
    ps.add(new Particle(random(width), random(height)));
  }
} // end reset()

// left click adds a single particle, right click resets all
void mousePressed() {
  if (mouseButton == LEFT) {
    ps.add(new Particle(mouseX, mouseY));
  }
  else {
    reset();
  }
} // end mousePressed()

// pressing any key resets as well
void keyPressed() {
  reset();
} // end keyPressed()
