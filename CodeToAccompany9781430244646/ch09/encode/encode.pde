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
// encode.pde, chapter 9
// Encodes the mostsignificant 4 bits of each color from the msg image into 
// the least significant 4 bits of the cover image.

PImage cover;   // To hold unencoded picture
PImage secret;  // To hold image to be encoded into the picture

// & with color to remove rightmost 4 bits from all R/G/B channels
// and all 8 bits from the entire Alpha channel
int clearSecretMask = 0xFF0F0F0F;
// & with color to remove rightmost 4 bits from all R/G/B channels
int clearCoverMask =  0x000F0F0F; 

void setup() {
  cover = loadImage("woods.jpg");   // Load the cover picture
  secret = loadImage("fall.jpg");   // Load the image to encode into the cover
  size(cover.width, cover.height);  // Size the sketch to be the same size as the cover
  image(cover, 0, 0);
} // end setup()

void draw() {
}

// When the mouse is clicked, encode image into cover
void mousePressed() {
  cover.loadPixels();  // Load pixels for the cover picture
  secret.loadPixels();  // Load pixels for the image to be encoded

  for (int i=0; i<cover.pixels.length; i++) {
    // Get pixel colors from both the cover and the secret images
    color cp = cover.pixels[i];
    color sp = secret.pixels[i];

    // strip off the Alpha and the least significant 4 bits of R, G and B 
    sp = sp & ~clearSecretMask;

    // right shift so that the most significant 4 bits are now in the 
    // least significant 4 bit position
    sp = sp >> 4;

    // Strip off least significant 4 bits of R, G, B from cover image
    cp = cp & ~clearCoverMask;

    // Add the bits from the secret image to cover's least significant bits
    cp = cp | sp;

    // Replace the encoded pixel back into the picture
    cover.pixels[i] = cp;
  }

  // Update pixels and save the encoded picture to a new file
  cover.updatePixels();
  image(cover, 0, 0);
  cover.save("encoded.png");  // save to named file as PNG
} // end mousePressed()

