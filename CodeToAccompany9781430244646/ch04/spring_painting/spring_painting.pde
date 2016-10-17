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
// spring_painting.pde, chapter 4
// Bonus code material: Algorithmically
// drawing with code.

float preyX, preyY, predX, predY;
float preyRadius = 7, predRadius, maxRadius = 40;
float preySpdX, preySpdY, predSpdX, predSpdY;
float springing = .0005, springDamping = .99;

void setup() {
  size(600, 600);
  background(0);
  noFill();
  preyX = predX = width/2;
  preyY = predY = height/2;
  preySpdX = random(-1.5, 1.5);
  preySpdY = random(-1.5, 1.5);
}

void draw() {
  lead();
  follow();
  render();
  constrainBounds();
}

void lead() {
  predRadius = abs(cos(frameCount*.1*PI/180 + PI/2)*maxRadius);

  preyX += preySpdX + random(-2.5, 2.5);
  preyY += preySpdY + random(-2.5, 2.5);
}
void follow() {
  float deltaX = preyX-predX;
  float deltaY = preyY-predY;

  // create springing effect
  deltaX *= springing;
  deltaY *= springing;

  predSpdX += deltaX;
  predSpdY += deltaY;

  // move predator's center
  predX += predSpdX;
  predY += predSpdY;

  // slow down springing
  predSpdX *= springDamping;
  predSpdY *= springDamping;
}

void render() {
  stroke(255, 255, 0, 30);
  line(preyX, preyY, predX, predY);

  // draw prey
  fill(255, 255);
  ellipse(preyX, preyY, 2, 2);
  noFill();
  stroke(50, 200, 200, 30);
  ellipse(preyX, preyY, preyRadius*2, preyRadius*2);

  // draw predator
  stroke(200, 20, 20, 20);
  ellipse(predX, predY, predRadius*2, predRadius*2);
}

void constrainBounds() {
  if (preyX > width-100) {
    preyX = width-100;
    preySpdX*=-1;
  } 
  else if (preyX < 100) {
    preyX = 100;
    preySpdX*=-1;
  }

  if (preyY > height-100) {
    preyY = height-100;
    preySpdY*=-1;
  } 
  else if (preyY < 100) {
    preyY = 100;
    preySpdY*=-1;
  }

  // follower wall collision
  if (predX > width-predRadius) {
    predX = width-predRadius;
    predSpdX *=- 1;
  } 
  else if (predX < predRadius) {
    predX = predRadius;
    predSpdX *=- 1;
  }

  if (predY > height-predRadius) {
    predY = height-predRadius;
    predSpdY *=- 1;
  } 
  else if (predY < predRadius) {
    predY = predRadius;
    predSpdY *=- 1;
  }
}

