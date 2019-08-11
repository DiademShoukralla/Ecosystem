class Liquid implements Drawable {
  List<Mover> inhabitants;
  
  // Top left coord of the Liquid shape
  PVector location;
  float liquidWidth, liquidHeight;
  float density;
  
  Liquid(PVector location, float liquidWidth, float liquidHeight, float density){
    super();
    this.location = location.copy();
    this.liquidWidth = liquidWidth;
    this.liquidHeight = liquidHeight;
    this.density = density;
    inhabitants = new ArrayList<Mover>();
  }
  
  void setLocation(PVector location){
    this.location = location;
  }
  
  PVector getLocation(){
    return location;
  }
  
  void update(){
    for(Mover inhabitant : inhabitants){
       System.out.println(inhabitant.getVelocity().mag());
      if(inLiquid(inhabitant) && abs(inhabitant.getVelocity().mag()) > 0.1){
        PVector drag = PVector.fromAngle(inhabitant.getVelocity().heading()).mult(-1);
        inhabitant.applyForce(drag);
      }
    }
  }
  
  boolean inLiquid(Mover inhabitant){
    PVector inhabitantLoc = inhabitant.getLocation();
    if(inhabitantLoc.x >= location.x && inhabitantLoc.x <= (location.x + liquidWidth)) {
      if(inhabitantLoc.y >= location.y && inhabitantLoc.y <= (location.y + liquidHeight)) {
        return true;
      }
    }
    return false;
  }
  
  void addInhabitant(Mover inhabitant){
    inhabitants.add(inhabitant);
  }
  
  void display(){
    noStroke();
    fill(0, 0, 255);
    rect(location.x, location.y, liquidWidth, liquidHeight);
  
  }

}
