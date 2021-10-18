//if mouse is close to astronaut he will do his job and look around
//if left idle the astronaut will collect money instead

class Astronaut {
  PVector position, target;
  PImage astronaut;
  boolean bothered = false;
  int markTime;
  int idleTime = 3000;
  int triggerDistance = 100;
  int targetDistance = 5;
  int targetTimer;
  float moveSpeed = 0.1;
  int moneybagChoice;

  Astronaut() {
    astronaut = loadImage("astronaut.png");
    position = new PVector(width/2, height/2);
    target = new PVector(random(width), random(height));
    targetTimer = 0;
  }

  void draw() {

    PVector mousePos = new PVector(mouseX, mouseY);
    bothered = (position.dist(mousePos) < triggerDistance);

    if (bothered) {
      markTime = millis();
      position = position.lerp(target, moveSpeed);
      if (position.dist(target) < targetDistance) {
        target = new PVector(random(width), random(height));
      }
    } 
    
    else if (!bothered && millis() > markTime + idleTime) { //if left alone go collect moneybags
      if (targetTimer == 0){
        pickMoneybagTarget();
        targetTimer = 200;
      }
      position = position.lerp(target, moveSpeed);
      targetTimer-=1;
    }
    if (!bothered && position.dist(target) < 8) {
      moneybags[moneybagChoice].notCollected = false; 
      pickMoneybagTarget();
    }
    image(astronaut, position.x, position.y);
  }
  
  void pickMoneybagTarget() {
    moneybagChoice = int(random(moneybags.length));

    if (moneybags[moneybagChoice].notCollected) {
      target = moneybags[moneybagChoice].position;
    }
  }
}
