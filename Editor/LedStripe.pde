import controlP5.*;

String id;
Button ledButton;

class LedStripe{

  LedStripe(PGraphics of, int x, int y, int num, ControlP5 cp5){
    id=Integer.toString(num);
    ledButton = cp5.addButton(id)
                       .setValue(0)
                       .setPosition(200+x,60+y)
                       .setSize(200,5)
                       .setSwitch(true)
                       .moveTo("global");
  }
}

