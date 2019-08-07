class Fish extends Mover {
  
  PShape fish;
  
  Fish() {
    super();
    fish = createShape(GROUP);
    
    PShape head, body;
    
    head = createShape(ELLIPSE, -25, 0, 50, 50);
    head.setFill(color(255));
    
    body = createShape(PShape.PATH);
    body.setStroke(0);
    body.beginShape();    
    body.vertex(0,  0);
    body.vertex(-100,  0);
    body.endShape();
    
    fish.addChild(body);
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
