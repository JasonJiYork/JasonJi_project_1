PImage space;
int numMoneybags = 10;

Astronaut astronaut;
Moneybag[] moneybags = new Moneybag[numMoneybags];


void setup() {
  frameRate(60);
  for (int i=0; i<numMoneybags; i++) 
  moneybags[i] = new Moneybag(random(100,1100), random(100,900));
  size(1200, 1000, P2D);
  space = loadImage("space.jpg");
  space.resize(width, height);

  astronaut = new Astronaut();
}
void draw() {
  image(space, 0, 0);
  for (int i=0; i<moneybags.length; i++) {
    moneybags[i].draw();
    moneybags[i].run();
  }
  astronaut.draw();
}
