class Fish extends Mover {
    
  PVector headLoc, tailLoc;
  int fishWidth, fishHeight, tailWidth, tailHeight;
  float counter;
  
  Fish() {
    super();
    
    fishWidth = 50;
    fishHeight = 100;
    tailWidth = 50;
    tailHeight = 30;
    headLoc = new PVector(0, 0);
    tailLoc = new PVector(-fishHeight, 0);
    
    counter = 0;
  }
  
  void update(){
    counter += 0.1;
   if(mousePressed) {
      PVector cursor = new PVector(mouseX, mouseY);
      PVector distance = getLocation().sub(cursor);
      PVector direction = distance.copy().normalize();
      applyForce(direction.mult(-log(distance.mag())));
      direction.add(new PVector(cos(counter), 0));
      applyForce(direction);
    }
    applyForce(new PVector(0, cos(counter)*acceleration.mag()*5));
    super.update();
  }
  
  void display() {
    noStroke();
    fill(50, 150, 255);
    circle(headLoc.x, headLoc.y, fishWidth);
    triangle(headLoc.x-5, headLoc.y + fishWidth/2, headLoc.x-5, headLoc.y - fishWidth/2, tailLoc.x, tailLoc.y);
    rotate(radians(25));
    ellipse(-40, 0, tailWidth, tailHeight/2);
    rotate(radians(155));
    arc(-tailLoc.x, tailLoc.y, tailWidth, tailHeight, QUARTER_PI, TWO_PI-QUARTER_PI, PIE);
    rotate(-radians(25));
    ellipse(45, 0, tailWidth, tailHeight/2);
  }

}
