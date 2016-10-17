void mouth(float x, float y, float w, float h) {
  curveTightness(random(-.4, .4));
  pushMatrix();
  scale(1+jtr(.2), 1+jtr(.05));

  // top lip
  beginShape();
  curveVertex(x+w, y);
  curveVertex(x, y);
  curveVertex(x+w/3.2, y-h/(2.5+jtr(.4)));
  curveVertex(x+w/2, y-h/3.1);
  curveVertex(x+w/1.4, y-h/(2.5+jtr(.4)));
  curveVertex(x+w, y);
  curveVertex(x, y);
  endShape();

  // bottom lip
  pushMatrix();
  scale(.98, 1.0);
  beginShape();
  curveVertex(x + w/2, y);
  curveVertex(x, y);
  curveVertex(x+w/3.2, y+h/(2.1+jtr(.2)));
  curveVertex(x+w/1.4, y+h/(2.2+jtr(.2)));
  curveVertex(x+w, y);
  curveVertex(x+w/2, y);
  endShape();

  // lip crease
  beginShape();
  curveVertex(x+w, y);
  curveVertex(x, y);
  curveVertex(x+w/3.2, y-h/(15.4+jtr(.2)));
  curveVertex(x+w/2, y*1.005);
  curveVertex(x+w/1.4, y-h/(15.7+jtr(.2)));
  curveVertex(x+w, y);
  curveVertex(x, y);
  endShape();
  popMatrix();

  popMatrix();
}

void mouth(float x, float y, float w, float h, boolean isNotVariable) {
  if (isNotVariable) {
    mouth(x, y, w, h);
  } 
  else {
    curveTightness(random(-.4, .4));
    pushMatrix();
    scale(1, 1);

    // top lip
    beginShape();
    curveVertex(x+w, y);
    curveVertex(x, y);
    curveVertex(x+w/3.2, y-h/(2.5));
    curveVertex(x+w/2, y-h/3.1);
    curveVertex(x+w/1.4, y-h/(2.5));
    curveVertex(x+w, y);
    curveVertex(x, y);
    endShape();

    // bottom lip
    pushMatrix();
    scale(.98, 1.0);
    beginShape();
    curveVertex(x + w/2, y);
    curveVertex(x, y);
    curveVertex(x+w/3.2, y+h/(1.7));
    curveVertex(x+w/1.4, y+h/(1.9));
    curveVertex(x+w, y);
    curveVertex(x+w/2, y);
    endShape();

    // lip crease
    beginShape();
    curveVertex(x+w, y);
    curveVertex(x, y);
    curveVertex(x+w/3.2, y-h/(15.4));
    curveVertex(x+w/2, y*1.005);
    curveVertex(x+w/1.4, y-h/(15.7));
    curveVertex(x+w, y);
    curveVertex(x, y);
    endShape();
    popMatrix();

    popMatrix();
  }
}

