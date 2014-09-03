import processing.video.*;
Movie move;
int a=0;

void setup() {
  size(200, 200);
  background(0);
  move= new Movie(this, "example.mov");
  move.loop();
}

void draw() {
  image(move, 0, 0);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
  save(a+".png");
  a=a+1;
}



And then a rotoscoping tool:

PImage imgC, imgBW;
int a =0;
// Size of transparency area around the mouse
int HALF_HOLE_SIZE = 7;
// Change to true to avoid restoring opacity (ie. paint with background image)
boolean bPersist = true;
int a=0;
void setup()
{
  size(300, 400);
  // Load a color image
  imgC = loadImage("book.jpg");
  // Load a black & white image (the same)
  imgBW = loadImage(a+".png");
  // Indicate we need transparency on this image
  imgBW.format = ARGB;
  noStroke();
  smooth();
  background(255);
}

void draw()
{ 
  // Draw the color image
  image(imgC, 0, 0);
  if (!bPersist)
  {
    // Restore opacity on previous position
    if (mousePressed==false) {
      ChangePixels(pmouseX, pmouseY, true);
    }
  }
  if (mousePressed==true) {
    // Make pixels transparent around the mouse position
    ChangePixels(mouseX, mouseY, false);
    // Draw the altered B&W image
    image(imgBW, 0, 0);
  }
} 

void ChangePixels(int x, int y, boolean bMakeOpaque)
{
  
  if (x <= HALF_HOLE_SIZE || x &rt;= imgBW.width - HALF_HOLE_SIZE) return;
  if (y <= HALF_HOLE_SIZE || y &rt;= imgBW.height - HALF_HOLE_SIZE) return;
  // Get the pixel data
  imgBW.loadPixels();

  for (int i = x - HALF_HOLE_SIZE; i <= x + HALF_HOLE_SIZE; i++)
  {
    for (int j = y - HALF_HOLE_SIZE; j <= y + HALF_HOLE_SIZE; j++)
    {
      if (bMakeOpaque)
      {
        imgBW.pixels[i + j * imgBW.width] |= 0xFF000000;
      }
      else // Make transparent
      {
        imgBW.pixels[i + j * imgBW.width] &= 0x00FFFFFF;
      }
    }
  }
  // Update the modified pixels
  imgBW.updatePixels();
}
void keyPressed() {

  if (key=='s');
  save(a+".png");
  a=a+1;
}
