class PreviewController {

  PGraphics of;
  ArrayList<LedStripe> LedStripesArray;
  boolean test = true;
  PreviewController (int nb_elmt, ControlP5 cp5) {
    
    LedStripesArray = new ArrayList<LedStripe>();


  }

  void setup(){
    of = createGraphics(1050, 750);
    for(int i = 0; i < 5; i++){
      LedStripesArray.add(new LedStripe(Integer.toString(i), of, i*20, i*10, cp5));
    }
  }

  void draw(){
    of.beginDraw();
    of.background(color(125));
    for (int i = 0; i < LedStripesArray.size(); i++) {
      LedStripesArray.get(i).draw();
    }
    of.endDraw();
    image(of, 200, 60);
  }
}

