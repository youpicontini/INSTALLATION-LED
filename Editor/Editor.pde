import controlP5.*;


ControlP5 cp5;


Animation anim;
PreviewController previewController;
OptionAnimation optAnim;
ListAnimation listAnim;

Canvas AnimationEditorMain;


Button PreviousKeyFrameButton;
Button NextKeyFrameButton;
Button PlayAnimButton;
Button SaveAnimButton;
Textlabel keyframe_name;
Textfield keyframe_begin_input;
CheckBox keyframe_end_checkbox;
Button SaveKeyframeButton;

int colourBG = color(0);
int colourSelected = color(150);

void setup() {

  size(1024,768);
  background(0);
  cp5 = new ControlP5(this);
  anim = new Animation();
  previewController = new PreviewController(5,cp5);
  previewController.setup();
  
  //****************Groups***** Group optionElementGroup = cp5.addGroup("optionElementGroup");
  Group animationsGroup = cp5.addGroup("Animations");
  Group optionElementGroup = cp5.addGroup("optionElementGroup");
  // *****ANIMATIONS*****

  optAnim = new OptionAnimation(cp5);
  listAnim = new ListAnimation(cp5);

                   

  
  
  //***** Animation main editor *****



  Group keyframEditGroup = cp5.addGroup("keyframEditGroup");

  keyframe_name = cp5.addTextlabel("keyframe_num")
                    .setText("keyframe_num")
                    .setPosition(200,580)
                    .setGroup("keyframEditGroup");

  keyframe_begin_input = cp5.addTextfield("at (s)")
                         .setPosition(200,600)
                         .setSize(50,15)
                         .setFocus(true)
                         .setGroup("keyframEditGroup");

  keyframe_end_checkbox = cp5.addCheckBox("endkeyframe")
                           .setPosition(260,600)
                           .setColorForeground(color(120))
                           .setColorActive(color(255))
                           .setColorLabel(color(255))
                           .setSize(20, 20)
                           .setItemsPerRow(3)
                           .setSpacingColumn(30)
                           .setSpacingRow(20)
                           .addItem("last keyframe?", 0)
                           .setGroup("keyframEditGroup");

  cp5.getTooltip().setDelay(0).register("until (s)","if blank, the default value will be the starting time of the next keyframe");
  
  SaveKeyframeButton = cp5.addButton("save keyframe")
                       .setValue(0)
                       .setPosition(690,600)
                       .setSize(72,20)
                       .setGroup("keyframEditGroup"); 
  
  Group keyframNavGroup = cp5.addGroup("keyframNavGroup");
  int nav_grp_y=680;

  PreviousKeyFrameButton = cp5.addButton("Previous")
                           .setValue(0)
                           .setPosition(200,nav_grp_y)
                           .setGroup("keyframNavGroup")
                           .setSize(100,40);
   
  PlayAnimButton = cp5.addButton("play")
                   .setValue(0)
                   .setPosition(355,nav_grp_y)
                   .setGroup("keyframNavGroup")
                   .setSize(100,40);

  SaveAnimButton = cp5.addButton("save")
                   .setValue(0)
                   .setPosition(510,nav_grp_y)
                   .setGroup("keyframNavGroup")
                   .setSize(100,40);

  NextKeyFrameButton = cp5.addButton("Next")
                       .setValue(0)
                       .setPosition(660,nav_grp_y)
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
  
  listAnim.newAnimButton.moveTo("editor");
  keyframEditGroup.moveTo("editor");
  keyframNavGroup.moveTo("editor");
  
  listAnim.NameAnimationLabel.moveTo("global");
}

void draw() {
  background(100);
  previewController.draw();
}

void controlEvent(ControlEvent e) {
  if(e.name().equals("New animation name")){
    //listAnim.highlightSelectedAnim(listAnim.indexAnim);
    listAnim.newAnimNameinput(listAnim.newAnimName_input.getText());
    if (listAnim.indexAnim>=19)
      listAnim.listAnimations.scroll(1);
  }
  if(e.name().equals("Animations list")){
    int currentIndex = (int)e.group().value();
    listAnim.highlightSelectedAnim(currentIndex);
  }
  if (e.isTab() && e.getTab().getName()=="default" && listAnim.newAnimName_input.isVisible()) {
    listAnim.NameAnimationLabel.show(); 
    listAnim.newAnimName_input.hide();
  }
  if(e.name().equals("new animation")){
    listAnim.toggleVisibilityNewAnimation();
  }
}



