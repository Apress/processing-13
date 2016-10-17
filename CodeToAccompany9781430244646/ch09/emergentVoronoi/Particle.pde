class Particle {
  PVector center;
  float radius;
  PVector v;
  color c;
  boolean stable;  

  Particle(float x, float y) {
    center = new PVector(x, y, 0);
    radius = 2;
    // green/blue 50% of the time and yellow/gold 50% of the time
    if (random(1) < 0.5) {
      c = color(random(170, 190), 70, random(100));
    }
    else { 
      c = color(random(40, 60), 70, random(100));
    }
    int i = nearestSite();
    v = PVector.sub(center, sites[i]);
    v.normalize();
    stable = false;
  } // end Particle()

  void display() {
    fill(c);
    ellipse(center.x, center.y, radius*2, radius*2);
  } // end display()

  // returns the index of the nearest site, also sets
  // stable to true if the two nearest nodes are equidistant
  int nearestSite() {
    // start with first site as nearest and 2nd site as next nearest
    float minDist = PVector.dist(center, sites[0]);  // calculate distance to the current nearest site
    float minDist2 = PVector.dist(center, sites[1]); // calculate distance to the current 2nd nearest site
    int minIdx = 0;                                  // index of the current nearest site
    int minIdx2 = 1;                                 // index of the current 2nd nearest site
    for (int i=1; i<sites.length; i++) {
      float d = PVector.dist(center, sites[i]);
      if (d < minDist) {      // if site[i] is found closer
        minDist2 = minDist;   // swap nearest site as 2nd nearest site
        minIdx2 = minIdx;     // swap site[i] as nearest site
        minDist = d;
        minIdx = i;
      }
      else if (d < minDist2) { // if site[i] is between nearest site and 2nd nearest site
        minDist2 = d;          // swap site[i] as 2nd nearest site
        minIdx2 = i;
      }
    }
    // if equidistant to two nearest sites
    if (minDist2 - minDist < 1) {
      stable = true;
    }
    return minIdx;
  } // end nearestNode()

  boolean update() {
    center.add(v);
    int i = nearestSite();
    float d = PVector.dist(center, sites[i]); 
    v = PVector.sub(center, sites[i]);
    v.normalize();
    v.mult(2);
    //off the screen, should be removed from ps
    return (center.x > width || center.x < 0 || center.y > height  || center.y < 0);
  } // end update()

  boolean converge() {
    return stable;
  }
} // end class Particle

