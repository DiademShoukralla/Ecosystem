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
  fullScreen(P2D);
  
  Button button = new Button("ESC");
  button.setLocation(new PVector(30, 20));
  drawables.add(button);
  clickables.add(button);
  
  
  PVector location = new PVector(random(width-500), random(height-800));
  Liquid pond = new Liquid(location, 800, 800, 1);
  drawables.add(pond);
  
  Fish fish;
  for(int i = 0; i < 5; i++){
    fish = new Fish();
    fish.setLocation(new PVector(random(width), random(height)));
    drawables.add(fish);
    pond.addInhabitant(fish);
  }
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
