void ear(float xTop, float yTop, float xBot, float yBot, float xRidge, float yRidge, float w, float h, int whichEar) {
  curveTightness(-1);
  pushMatrix();
 
  if (whichEar == 0) { // left
    // outer ear
    beginShape();
    curveVertex(xTop+10, yTop+85);
    curveVertex(xTop, yTop);
    curveVertex(xTop-w/2.3, yTop+35);
    curveVertex(xBot, yBot);
    curveVertex(xBot+w, yBot-30);
    endShape();

    // innner ridge:
    beginShape();
    curveVertex(xRidge, yRidge+80);
    curveVertex(xRidge, yRidge);
    curveVertex(xTop-w/2.3, yTop+35);
    curveVertex(xTop-w/2.5, yTop+175);
    endShape();
  } 
  else { // right
    // outer ear
    beginShape();
    curveVertex(xTop+10, yTop+85);
    curveVertex(xTop, yTop);
    curveVertex(xTop+w/2.3, yTop+35);
    curveVertex(xBot, yBot);
    curveVertex(xBot-w, yBot-30);
    endShape();

    // innner ridge:
    beginShape();
    curveVertex(xRidge, yRidge+80);
    curveVertex(xRidge, yRidge);
    curveVertex(xTop+w/2.3, yTop+35);
    curveVertex(xTop+w/2.5, yTop+175);
    endShape();
  }
  
  popMatrix();
}

