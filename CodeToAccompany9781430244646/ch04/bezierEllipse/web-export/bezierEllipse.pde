// Bezier Ellipse Example
// requires 4 vertices

void setup() {
  size(400, 400);
  background(255);
  translate(width/2, height/2);
  bezierEllipse(4, width*.375, 4);
}

void bezierEllipse(int pts, float radius, float handleRadius) {
  float theta = 0;
  float cx1 = 0, cy1 = 0;
  float cx2 = 0, cy2 = 0;
  float ax = 0, ay = 0;
  float rot = TWO_PI/pts;
  float controlTheta1 = rot/3.0;
  float controlTheta2 = controlTheta1*2.0;
  float controlRadius = radius/cos(controlTheta1);

  beginShape();
  for (int i=0; i<pts; i++) {
    cx1 = cos(theta + controlTheta1)*controlRadius;
    cy1 = sin(theta + controlTheta1)*controlRadius;
    cx2 = cos(theta + controlTheta2)*controlRadius;
    cy2 = sin(theta + controlTheta2)*controlRadius;
    ax = cos(theta + rot)*radius;
    ay = sin(theta + rot)*radius;

    if (i==0) {
      // initial vertex required for bezierVertex()
      vertex(cos(0)*radius, sin(0)*radius);
    } 
    // close ellipse
    if (i==pts-1) {
      bezierVertex(cx1, cy1, cx2, cy2, ax, ay);
    }
    // ellipse body
    else {
      bezierVertex(cx1, cy1, cx2, cy2, ax, ay);
    }

    // Use cx2, cy2 of current vertex and cx1, cy1 of next vertex 
    // to draw handles between anchor and controls
    float cx1Next = cos(theta + controlTheta1 + rot)*controlRadius;
    float cy1Next = sin(theta + controlTheta1 + rot)*controlRadius;
    line(ax, ay, cx1Next, cy1Next);
    line(ax, ay, cx2, cy2);

    // draw control and anchor points
    fill(0, 0, 255);
    rect(cx1-handleRadius, cy1-handleRadius, handleRadius*2, handleRadius*2);
    fill(0, 255, 255);
    rect(cx2-3, cy2-3, handleRadius*2, handleRadius*2);
    fill(255, 127, 0);
    ellipse(ax, ay, handleRadius*2, handleRadius*2);

    theta += rot;
  }
  fill(0, 127);
  noStroke();
  endShape();
} // end bezierEllipse


