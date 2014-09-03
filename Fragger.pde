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
