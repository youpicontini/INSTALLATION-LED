class PreviewController {
  
  PGraphics of;
  LedStripe led;
  
  PreviewController (int nb_elmt, ControlP5 cp5) {
    ArrayList<LedStripe> LedStripesArray = new ArrayList<LedStripe>();
    
    for(int i = 0; i < nb_elmt; i++){
      led = new LedStripe(of, i*20, i*10, i, cp5);
      LedStripesArray.add(led);
    }
  }
  
  void setup(){
    of = createGraphics(1050, 750);
  }
  
  void draw(){
    of.beginDraw();
    of.background(color(0));
    of.stroke(0);
    of.endDraw();
    image(of, 200, 60);
  }
}

