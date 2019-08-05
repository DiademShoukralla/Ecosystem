import java.util.function.Function; 

/*
* Simple Button class
*/
class Button implements Drawable, Clickable {
  
  final color PRESSED = color(36, 130, 173);
  final color HOVER = color(102, 182, 222);
  final color DEFAULT = color(22, 272, 242);
  
  PVector location;
  color backgroundColor, borderColor;
  int btnRadius;
  int cursorType;
  boolean isPressed;
  
  String text;
  
  Button() {
    location = new PVector(0, 0);
    btnRadius = 7;
    isPressed = false;
    borderColor = color(204, 216, 235);
    
    text = "";
  }
  
  Button(String text) {
    this();
    this.text = text;
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
  
  float getWidth(){
    return textWidth(text) * 2;
  }
  
  float getHeight(){
    return 55;
  }
  
  boolean isMouseHover() {
    float upperX, upperY, lowerX, lowerY;
    upperX = location.x + getWidth();
    upperY = location.y + getHeight();
    lowerX = location.x;
    lowerY = location.y;
    if(mouseX >= lowerX && mouseX <= upperX) {
      if(mouseY >= lowerY && mouseY <= upperY) {
        return true;
      }
    }
    return false;
  }
  
  /*
  * Perform the action intended when the buttono is clicked.
  */
  void click() {
    System.out.println("I'm clicked!");
  }
  
  /*
  * Update display or other attributes when the button is actively pressed.
  */
  void press(){
    isPressed = true;
  }
  
  /*
  * Update display or other attributes when the button is released.
  */
  void release(){
    isPressed = false;
  }
  
  void display(){
    cursor(cursorType);
    stroke(borderColor);
    fill(backgroundColor);
    rect(location.x, location.y, getWidth(), getHeight(), btnRadius);
    fill(color(255, 255, 255));
    text(text, location.x + getWidth()/2 - textWidth(text)/2, location.y + (getHeight() * 0.66));
  }
  
  void update() {
    textSize(24);
    if(isPressed) {
      cursorType = HAND;
      backgroundColor = PRESSED;
    }else if(isMouseHover()){
      cursorType = HAND;
      backgroundColor = HOVER;
    } else {
      cursorType = ARROW;
      backgroundColor = DEFAULT;
    }
  }
}
