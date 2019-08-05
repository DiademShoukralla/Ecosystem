/*
* Basic mover with velocity and acceleration. 
*
*/
abstract class Mover implements Drawable {
  
  PVector location, velocity, acceleration;
  
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
  
  }
  
  abstract void display();
}
