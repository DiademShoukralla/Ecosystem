/*
* Basic mover with velocity and acceleration. 
*
*/
abstract class Mover implements Drawable {
  
  PVector location, velocity, acceleration;
  
  void setLocation(PVector location) {
    this.location = location;
  }
  
  PVector getLocation() {
    return location;
  }
  
  Mover() {
    location = new PVector(0, 0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void update(){
    updateAcceleration();
    velocity.add(acceleration);
    location.add(velocity);
  }
  
  void updateAcceleration(){
    PVector cursor = new PVector(mouseX, mouseY);
    PVector direction = PVector.sub(cursor, location);
    direction.normalize();
    PVector.mult(direction, 0.3, acceleration);
  }
}
