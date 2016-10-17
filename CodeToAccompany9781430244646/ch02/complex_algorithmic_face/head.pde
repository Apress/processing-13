void head(float x, float y, float w, float h) {

  // EYES
  float eyeWidth = w/5;
  float eyeHeight = eyeWidth/2;
  float irisDiam = eyeHeight;
  float pupilDiam = irisDiam/3;
  float eye_y = y+h/2-eyeHeight/2;
  // left
  float leftEye_x = x+eyeWidth;
  float leftIris_x = leftEye_x + eyeWidth/2-irisDiam/2;
  float leftPupil_x = leftEye_x + eyeWidth/2-pupilDiam/2;
  // right
  float rightEye_x = x+eyeWidth*3;
  float rightIris_x = rightEye_x + eyeWidth/2-irisDiam/2;
  float rightPupil_x = rightEye_x + eyeWidth/2-pupilDiam/2;

  //EYEBROWS
  float eyeBrowWidth = eyeWidth*1.25;
  float eyeBrowHeight = eyeHeight/4;
  float eyeBrow_y = eye_y - eyeHeight - eyeBrowHeight/2;
  // left
  float leftEyeBrow_x = leftEye_x - (eyeBrowWidth-eyeWidth);
  // right
  float rightEyeBrow_x = rightEye_x;

  // NOSE
  float nose_x = x+eyeWidth*2;
  float nose_y = y + h - h/3.5;

  // MOUTH
  float mouthWidth = eyeWidth*1.5;
  float mouthHeight = h/10;
  float mouth_x = leftIris_x+irisDiam/2+eyeWidth/4;
  float mouth_y = nose_y + mouthHeight*1.25;

  // EARS
  float earWidth = eyeHeight*1.5;
  float earHeight = h/4;
  float earTop_y = eyeBrow_y;
  float earBottom_y = 0.0;
  // left
  float leftEarTop_x = x-earWidth/2;
  float leftEarBottom_x = 0.0;
  float leftEarRidgeTop_x = 0.0;
  float leftEarRidgeTop_y = 0.0;
  // right
  float rightEarTop_x = x+w-earWidth/2;
  float rightEarBottom_x = 0.0;
  float rightEarRidgeTop_x = 0.0;
  float rightEarRidgeTop_y = 0.0;



  curveTightness(random(-.1, .1));
  curveTightness(0);
  pushMatrix();
  scale(1+jtr(.2), 1+jtr(.2));

  // start top middle of head
  beginShape();
  curveVertex(x, y);
  curveVertex(x+w/2, y);
  curveVertex(x+w*.81, y+h/18);
  curveVertex(x+w*.96, y+h/3.9);
  curveVertex(x+w*.971, y+h/2.4);

  rightEarTop_x = x+w*.971;
  earTop_y = y+h/2.4;
  curveVertex(x+w*.979, y+h/2); // Right Inner Ridge Top

  rightEarRidgeTop_x = x+w*.979;
  rightEarRidgeTop_y = y+h/2;
  curveVertex(x+w*.98, y+h/1.8);
  curveVertex(x+w*.947, y+h/1.52);

  rightEarBottom_x = x+w*.947;
  earBottom_y = y+h/1.52;
  curveVertex(x+w*.89, y+h/1.25);
  curveVertex(x+w*.75, y+h/1.1);  // 1 
  curveVertex(x+w/2, y+h);
  curveVertex(x+w*.25, y+h/1.1);  // -1
  curveVertex(x+w*.11, y+h/1.25); // -2 
  curveVertex(x+w*.053, y+h/1.52); // -3 // Left EAR Bottom

  leftEarBottom_x = x+w*.053;
  curveVertex(x+w*.02, y+h/1.8); // -4
  curveVertex(x+w*.021, y+h/2); // Left Inner Ridge Top

  leftEarRidgeTop_x = x+w*.021;
  leftEarRidgeTop_y = y+h/2;
  curveVertex(x+w*.029, y+h/2.4); // Left EAR TOP

  leftEarTop_x = x+w*.029;
  earTop_y = y+h/2.4;
  curveVertex(x+w*.04, y+h/3.9);
  curveVertex(x+w*.19, y+h/18);
  curveVertex(x+w/2, y);
  curveVertex(x+w*.81, y+h/18);
  endShape();

  nose(nose_x, nose_y, eyeWidth, headHeight/8);
  mouth(mouth_x, mouth_y, mouthWidth, mouthHeight);

  // left eye
  eye(leftEye_x, eye_y, eyeWidth, eyeHeight*.85, 0);
  eye(rightEye_x, eye_y, eyeWidth, eyeHeight*.85, 1);

  // Draw eyebrows (these should really be replaced with curves)
  rect(leftEyeBrow_x, eyeBrow_y, eyeBrowWidth, eyeBrowHeight);
  rect(rightEyeBrow_x, eyeBrow_y, eyeBrowWidth, eyeBrowHeight);

  ear(leftEarTop_x, earTop_y, leftEarBottom_x, earBottom_y, leftEarRidgeTop_x, leftEarRidgeTop_y, earWidth, earHeight, 0); // left 
  ear(rightEarTop_x, earTop_y, rightEarBottom_x, earBottom_y, rightEarRidgeTop_x, rightEarRidgeTop_y, earWidth, earHeight, 1); // right
  popMatrix();
}

