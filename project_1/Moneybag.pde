class Moneybag {
  PVector position;
  float sizeVal;
  boolean notCollected  = true;
  PImage moneybag;
  
  Moneybag(float x, float y) {
    moneybag = loadImage("moneybag.png");
    position = new PVector(x, y);
  }
    
  void draw() {
    if (notCollected) {
      ellipseMode(CENTER);
      noStroke();
      fill(0);
      image(moneybag, position.x, position.y);
    }
  }


  void run(){
    draw();
  }
}
