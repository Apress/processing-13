void eye(float x, float y, float w, float h, int which) {
  float pupilDiam = h*.25;

  ellipseMode(CENTER);
  curveTightness(-.5);
  pushMatrix();


  if (which == 0) { // left
    // top
    beginShape();
    curveVertex(x+w, y);
    curveVertex(x, y+h/2);
    curveVertex(x+w/2, y);
    curveVertex(x+w, y+h/1.25);
    curveVertex(x+w, y+h/1.25);
    endShape();

    // bottom
    beginShape();
    curveVertex(x+w, y+h/1.25);
    curveVertex(x+w, y+h/1.25);
    curveVertex(x+w/2, y+h);
    curveVertex(x, y+h/2);
    curveVertex(x, y+h/2);
    //ellipse(x, y, 2, 2);
    endShape();

    // iris
    ellipse((x+w/2), (y+h/2), h, h);
    // pupil
    ellipse((x+w/2), (y+h/2), pupilDiam, pupilDiam);
  } 
  else { // right
    // top
    beginShape();
    curveVertex(x, y);
    curveVertex(x+w, y+h/2);
    curveVertex(x+w/2, y);
    curveVertex(x, y+h/1.25);
    curveVertex(x, y+h/1.25);
    endShape();

    // bottom
    beginShape();
    curveVertex(x+w, y+h/2);
    curveVertex(x+w, y+h/2);
    curveVertex(x+w/2, y+h);
    curveVertex(x, y+h/1.25);
    curveVertex(x, y+h/1.25);
    endShape();

    // iris
    ellipse((x+w/2), (y+h/2), h, h);
    // pupil
    ellipse((x+w/2), (y+h/2), pupilDiam, pupilDiam);
  }

  popMatrix();
  ellipseMode(CORNER);
}

