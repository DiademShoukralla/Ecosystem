class Fish extends Mover {
  
  PShape fish;
  
  Fish() {
    super();
    fish = createShape(GROUP);
    fish.setName("fish");
    
    PShape head, tail;
    
    head = createShape(ELLIPSE, 0, 0, 50, 50);
    head.setName("head");
    head.setFill(color(255));
    head.setStroke(color(255));
    
    tail = createShape(TRIANGLE, -100, 0, 0, -25, 0, 25);
    tail.setName("tail");
    tail.setFill(color(255));
    tail.setStroke(color(255));
    
    fish.addChild(tail);
    fish.addChild(head);
  }
  
  void update(){
   if(mousePressed) {
      PVector cursor = new PVector(mouseX, mouseY);
      PVector distance = getLocation().sub(cursor);
      PVector direction = distance.copy().normalize().mult(-log(distance.mag()));
      applyForce(direction);
    }
    applyForce(getAcceleration().normalize().mult(1));
    super.update();
  }
  
  void display() {
    shape(fish);
  }

}
