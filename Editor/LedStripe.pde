import controlP5.*;

String id;

class LedStripe{

  LedStripe(PGraphics of, int x, int y, int num, ControlP5 cp5){
    id=Integer.toString(num);
    Button ledButton;
    ledButton = cp5.addButton(id)
                       .setValue(0)
                       .setPosition(200+x,160+y)
                       .setSize(200,5)
                       .moveTo("global");
  }
}

