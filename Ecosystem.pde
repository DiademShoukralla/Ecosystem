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
  for(Clickable clickable : clickables){
    if(clickable.isMouseHover()) {
      clickable.click();
      break;
    }
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
