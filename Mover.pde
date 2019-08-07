/*
* Basic mover with velocity and acceleration. 
*
*/
abstract class Mover implements Drawable {
  
  PVector location, velocity, acceleration;
  
  float mass;
  
  void setLocation(PVector location) {
    this.location = location;
  }
  
  PVector getLocation() {
    return location.copy();
  }
  
  Mover() {
    location = new PVector(0, 0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(10, 20);
  }
  
  void update(){
    velocity.add(acceleration);
    velocity.limit(10);
    location.add(velocity);
    
    translate(location.x, location.y);
    rotate(acceleration.heading());
    acceleration.mult(0);
  }
  
  void applyForce(PVector newForce){
    PVector force = newForce.copy();
    acceleration.add(force.div(mass));
  }
  
  float getMass(){
    return mass;
  }
  
  PVector getAcceleration() {
    return acceleration.copy();
  }
  
  PVector getVelocity() {
    return velocity.copy();
  }
}
