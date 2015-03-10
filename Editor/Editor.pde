import controlP5.*;


ControlP5 cp5;
Animation anim;
PreviewController previewController;
OptionAnimation optAnim;
ListAnimation listAnim;
Textlabel Project_name;
Textlabel frameRate_project;
Canvas AnimationEditorMain;


Button PreviousKeyFrameButton;
Button NextKeyFrameButton;
Button PlayAnimButton;
Button SaveAnimButton;
Textlabel keyframe_name;
Textfield keyframe_duration_input;
CheckBox keyframe_end_checkbox;
Button SaveKeyframeButton;

String TESTVAL;
void setup() {

  size(1440,900);
  cp5 = new ControlP5(this);
  anim = new Animation();
  previewController = new PreviewController(5,cp5);
  previewController.setup();
  
  //****************Groups***** 
  Group animationsGroup = cp5.addGroup("Animations");
  Group optionElementGroup = cp5.addGroup("optionElementGroup");
  // *****ANIMATIONS*****

  optAnim = new OptionAnimation(cp5);
  listAnim = new ListAnimation(cp5);
  
  Project_name = cp5.addTextlabel("projectname")
                    .setText("L8DIAMOND")
                    .setPosition(880,20)
                    .setColorValue(0x00ffff)
                    .setFont(createFont("",30));
  
  frameRate_project = cp5.addTextlabel("projectname")
                    .setPosition(800,20)
                    .setColorValue(0x00ffff)
                    .setFont(createFont("",30));
  
  //***** Animation main editor *****
  Group keyframEditGroup = cp5.addGroup("keyframEditGroup");

  int nav_grp_y=710;
  keyframe_name = cp5.addTextlabel("keyframe_num")
                    .setText("keyframe_num")
                    .setPosition(200,nav_grp_y)
                    .setGroup("keyframEditGroup");

  keyframe_duration_input = cp5.addTextfield("for (s)")
                         .setPosition(200,nav_grp_y+20)
                         .setSize(50,20)
                         .setFocus(true)
                         .setGroup("keyframEditGroup")
                         .setValue(0.5)
                         .setText("0.5");

  Group keyframNavGroup = cp5.addGroup("keyframNavGroup");
  

  PreviousKeyFrameButton = cp5.addButton("Previous")
                              .setValue(0)
                              .setPosition(200,nav_grp_y+80)
                              .setGroup("keyframNavGroup")
                              .setSize(100,40);
   
  PlayAnimButton = cp5.addButton("play")
                      .setValue(0)
                      .setPosition(355,nav_grp_y+80)
                      .setGroup("keyframNavGroup")
                      .setSize(100,40);

  SaveAnimButton = cp5.addButton("save")
                      .setValue(0)
                      .setPosition(510,nav_grp_y+80)
                      .setGroup("keyframNavGroup")
                      .setSize(100,40);

  NextKeyFrameButton = cp5.addButton("Next")
                          .setValue(0)
                          .setPosition(660,nav_grp_y+80)
                          .setGroup("keyframNavGroup")
                          .setSize(100,40);

  //*****TABS*****
  cp5.addTab("editor");
  cp5.getTab("default")
     .activateEvent(true)
     .setLabel("player")
     .setId(1);

  cp5.getTab("editor")
     .activateEvent(true)
     .setId(2);
   
  //move to tabs 
   
  optionElementGroup.moveTo("editor");
  animationsGroup.moveTo("global");
  Project_name.moveTo("global");
  listAnim.newAnimButton.moveTo("editor");
  keyframEditGroup.moveTo("editor");
  keyframNavGroup.moveTo("editor");
  
  listAnim.NameAnimationLabel.moveTo("global");
}

void draw() {
  background(100);
  previewController.draw();
  frameRate_project.setText(Float.toString(Math.round(frameRate)));
}

