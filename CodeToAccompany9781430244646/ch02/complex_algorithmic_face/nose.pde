void nose(float x, float y, float w, float h) {
  curveTightness(random(-.4, .4));
  pushMatrix();
  scale(1+jtr(.2), 1);
  beginShape();
  curveVertex(x+w/2, y-h/2);
  curveVertex(x+w/16, y-h/2);
  curveVertex(x-w/16, y-h/4.5);
  curveVertex(x, y); // left bottom corner
  curveVertex(x+w/4, y);
  curveVertex(x+w/2, y+h/6); // filtrum
  curveVertex(x+w/2+w/4, y);
  curveVertex(x+w, y); // right bottom corner
  curveVertex(x+w+w/16, y-h/4.5);
  curveVertex(x+w-w/16, y-h/2);
  curveVertex(x+w-w/2, y-h/2);
  endShape();

  popMatrix();
}

void nose(float x, float y, float w, float h, boolean isNotVariable) {
  if (isNotVariable) {
    nose(x, y, w, h);
  } 
  else {
    curveTightness(random(-.4, .4));
    pushMatrix();
    scale(1+jtr(.2), 1);
    beginShape();
    curveVertex(x+w/2, y-h/2);
    curveVertex(x+w/16, y-h/2);
    curveVertex(x-w/16, y-h/4.5);
    curveVertex(x, y); // left bottom corner
    curveVertex(x+w/4, y);
    curveVertex(x+w/2, y+h/6); // filtrum
    curveVertex(x+w/2+w/4, y);
    curveVertex(x+w, y); // right bottom corner
    curveVertex(x+w+w/16, y-h/4.5);
    curveVertex(x+w-w/16, y-h/2);
    curveVertex(x+w-w/2, y-h/2);
    endShape();
    popMatrix();
  }
}

