/*
* Simple Button class
*/
class Button implements Drawable, Clickable {
  
  PVector location;
  color backgroundColor, borderColor;
  int btnHeight, btnWidth, btnRadius;
  int cursorType;
  
  Button() {
    location = new PVector(0, 0);
    btnHeight = 55;
    btnWidth = 55;
    btnRadius = 7;
  }
  
  void setLocation(PVector location){
    this.location = location;
  }
  
  PVector getLocation() {
    return location;
  }
  
  void setBackgroundColor(color backgroundColor){
    this.backgroundColor = backgroundColor;
  }
  
  void setBorderColor(color borderColor){
    this.borderColor = borderColor;
  }
  
  boolean isMouseHover() {
    float upperX, upperY, lowerX, lowerY;
    upperX = location.x + btnWidth;
    upperY = location.y + btnHeight;
    lowerX = location.x;
    lowerY = location.y;
    if(mouseX >= lowerX && mouseX <= upperX) {
      if(mouseY >= lowerY && mouseY <= upperY) {
        return true;
      }
    }
    return false;
  }
  
  void click() {
    System.out.println("I'm clicked!");
  }
  
  void press(){
    System.out.println("I'm pressed!");
  }
  
  void release(){
    System.out.println("I'm released!");
  }
  
  void display(){
    push();
    cursor(cursorType);
    stroke(backgroundColor);
    fill(borderColor);
    rect(location.x, location.y, btnWidth, btnHeight, btnRadius);
    pop();
  }
  
  void update() {
    if(isMouseHover()){
      cursorType = HAND;
    } else {
      cursorType = ARROW;
    }
  }
}
