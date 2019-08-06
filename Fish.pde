class Fish extends Mover {
  
  PShape fish;
  
  Fish() {
    super();
    fish = createShape(GROUP);
    
    PShape head, body;
    //ellipseMode(CORNER);
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
  
  void display() {
    translate(location.x, location.y);
    rotate(acceleration.heading());

    shape(fish);
  }
  
  void update(){
    super.update();
  }

}
