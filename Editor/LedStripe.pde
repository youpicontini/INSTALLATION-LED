class LedStripe{  
  String id;
  PGraphics canvas;
  int x;
  int y;
  ControlP5 cp5;
  
  Button ledButton;
  
  LedStripe(String _id, PGraphics _canvas, int _x, int _y, ControlP5 _cp5){
    id =_id;
    canvas = _canvas;
    x = _x;
    y = _y;
    cp5 = _cp5;
    
    color c = color(0,0,0,1);    
    CColor couleur = new CColor(c, c, c, c, c);
    
    ledButton = cp5.addButton(id)
                       .setValue(0)
                       .setPosition(200+x,60+y)
                       .setSize(200,5)
                       .setColor(couleur)
                       .setSwitch(true)
                       .moveTo("editor");
  }
  
  void draw(){
    canvas.rect(x, y, 200, 5);
  }
}

