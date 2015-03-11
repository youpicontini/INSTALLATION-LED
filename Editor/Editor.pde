import controlP5.*;

ControlP5 cp5;
Animation anim;
PreviewController previewController;
GuiManager guiManager;

String PROJECTNAME;

void setup() {

  size(1440,900);
  PROJECTNAME="L8DIAMOND";
  frame.setTitle(PROJECTNAME);
  cp5 = new ControlP5(this);
  guiManager = new GuiManager(cp5);
  anim = new Animation();
  previewController = new PreviewController(5,cp5);
  previewController.setup();
  
  
}

void draw() {
  background(100);
  previewController.draw();
  guiManager.draw();
}

