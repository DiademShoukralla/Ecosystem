import java.util.ArrayList;
import java.util.List;

/*
* Ecosystem Simulation
*
* Author: Diadem Shoukralla
*
**/

List<Drawable> drawables;
List<Clickable> clickables;
Clickable activeClick;

void setup(){
  drawables = new ArrayList();
  clickables = new ArrayList();
  activeClick = null;
  fullScreen();
  
  Button button = new Button("ESC");
  button.setLocation(new PVector(30, 20));
  drawables.add(button);
  clickables.add(button);
 
}

void draw(){
  background(230);
  for(Drawable drawable : drawables){
    push();
    drawable.update();
    drawable.display();
    pop();
  }
}

void keyPressed() {
  if(key == ESC) {
    exit();
  }
}

void mouseClicked(){
  boolean hasClick = false;
  for(Clickable clickable : clickables){
    if(clickable.isMouseHover()) {
      clickable.click();
      hasClick = true;
      break;
    }
  }
  if(!hasClick) {
    Fish fish = new Fish();
    fish.setLocation(new PVector(mouseX, mouseY));
    drawables.add(fish);
  }
}

void mousePressed(){
  for(Clickable clickable : clickables){
    if(clickable.isMouseHover()) {
      clickable.press();
      activeClick = clickable;
      break;
    }
  }
}

void mouseReleased() {
  if(activeClick != null) {
    activeClick.release();
    activeClick = null;
  }
}
