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
// simple_house2.pde, chapter 2
// Simple house drawing simulating perspective.

size(800, 600);
// declare variables
float houseW = 700;
float frontHouseW = houseW*.75, houseH = houseW*.5;
float sideHouseW = houseW-frontHouseW;
float offset = houseH/7;
float houseX = width-(frontHouseW+offset), houseY = height-(houseH+offset);
float perspectiveShift = offset*2;
float roofH = houseH/2.5;
float doorW = frontHouseW/8;
float doorH = doorW*2;
float doorX = houseX+frontHouseW/2-doorW/2;
float doorY = houseY + houseH-doorH;
float windowW = frontHouseW/2-offset-doorW/2;
float windowH = houseH-doorH-offset*2;
float windowX = houseX + offset;
float windowY = houseY + offset;
int paneGap = 9;
float paneW = windowW/2-paneGap;
float paneH = windowH/2-paneGap;
// DRAW HOUSE
// house front
rect(houseX, houseY, frontHouseW, houseH);
// house side
quad(houseX, houseY, houseX, houseY+houseH, houseX-sideHouseW, houseY+houseH-perspectiveShift, houseX-sideHouseW, houseY+perspectiveShift);
// roof front
quad(houseX, houseY, houseX+frontHouseW, houseY, houseX+frontHouseW-sideHouseW/2, houseY-roofH, houseX-sideHouseW/2, houseY-roofH);
// roof side
triangle(houseX, houseY, houseX-sideHouseW/2, houseY-roofH, houseX-sideHouseW, houseY+perspectiveShift);
//door
rect(doorX, doorY, doorW, doorH);
//door knob
ellipse(doorX+doorW*.2, doorY + doorH*.6, doorW*.1, doorW*.1);
// window left
rect(windowX, windowY, paneW, paneH);
rect(windowX + paneW + paneGap, windowY, paneW, paneH);
rect(windowX, windowY+paneH+paneGap, paneW, paneH);
rect(windowX + paneW + paneGap, windowY+paneH+paneGap, paneW, paneH);
// window right
windowX += windowW+doorW;
rect(windowX, windowY, paneW, paneH);
rect(windowX + paneW + paneGap, windowY, paneW, paneH);
rect(windowX, windowY+paneH+paneGap, paneW, paneH);
rect(windowX + paneW + paneGap, windowY+paneH+paneGap, paneW, paneH);
