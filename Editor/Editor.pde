import controlP5.*;


ControlP5 cp5;

ListBox listAnimations;
Animation anim;


Textlabel optionsAnimElementLabel;
RadioButton radioOptionsAnimElement;
Button newAnimButton;
Canvas AnimationEditorMain;
Textlabel NameAnimationLabel;
Textfield newAnimName_input;

PGraphics of;
Button PreviousKeyFrameButton;
Button NextKeyFrameButton;
Button PlayAnimButton;
Button SaveAnimButton;
Textlabel keyframe_name;
Textfield keyframe_begin_input;
CheckBox keyframe_end_checkbox;
Button SaveKeyframeButton;
int selectedIndex = -1;//no selection initially
int colourBG = color(0);
int colourSelected = color(150);
int indexAnim=0;

void setup() {

  size(1024,768);
  background(0);
  cp5 = new ControlP5(this);
  anim = new Animation();

  // *****ANIMATIONS*****
  Group animationsGroup = cp5.addGroup("Animations");

  newAnimButton = cp5.addButton("new_animation")
                   .setValue(0)
                   .setPosition(20,600)
                   .setSize(67,19)
                   .setGroup("Animations");
                   
  newAnimName_input = cp5.addTextfield("newAnimName_input")
                       .setPosition(200,120)
                       .setSize(100,20)
                       .setFocus(true)
                       .setGroup("Animations")
                       .hide();

  listAnimations = cp5.addListBox("Animations list")
                    .setPosition(20,160)
                    .setSize(170, 440)
                    .setItemHeight(20)
                    .setBarHeight(20)
                    .setColorBackground(color(50))
                    .setColorActive(color(150))
                    .setColorForeground(color(150))
                    .setGroup("Animations");

  listAnimations.captionLabel().toUpperCase(true);
  listAnimations.captionLabel();
  listAnimations.captionLabel().set("Animations");
  listAnimations.captionLabel().setColor(color(150));
  listAnimations.captionLabel().style().marginTop = 3;
  listAnimations.valueLabel().style().marginTop = 3;
  
  
  
 //***** options elements led, light etc.. *****

 Group optionElementGroup = cp5.addGroup("optionElementGroup");
 
 optionsAnimElementLabel = cp5.addTextlabel("optionsAnimElementLabel")
                            .setText("LED OPTIONS")
                            .setPosition(800,140)
                            .setGroup("optionElementGroup");

 radioOptionsAnimElement = cp5.addRadioButton("OptionAnimElement")
                            .setPosition(800,160)
                            .setSize(20,20)
                            .setColorForeground(color(120))
                            .setColorActive(color(255))
                            .setColorLabel(color(255))
                            .setItemsPerRow(1)
                            .setSpacingColumn(30)
                            .setGroup("optionElementGroup");

  radioOptionsAnimElement.addItem("on",1).setGroup("optionElementGroup");
  
  radioOptionsAnimElement.addItem("off",2).setGroup("optionElementGroup");



  //***** Animation main editor *****
  of = createGraphics(560, 420);
  
  NameAnimationLabel = cp5.addTextlabel("nameAnimElementLabel")
                        .setText("Choose Animation")
                        .setPosition(200,140);

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
  animationsGroup.moveTo("global");
  newAnimButton.moveTo("editor");  
   
  optionElementGroup.moveTo("editor");
   
  keyframEditGroup.moveTo("editor");   
  keyframNavGroup.moveTo("editor");
   
  NameAnimationLabel.moveTo("global");
 
}

void draw() {
  background(0);  
  of.beginDraw();
  of.background(100);
  of.stroke(255);
  of.endDraw();
  image(of, 200, 160);
}



void controlEvent(ControlEvent e) {
  if(e.name().equals("newAnimName_input")){
    highlightSelectedAnim(indexAnim-1);
  }
  if(e.name().equals("Animations list")){
    int currentIndex = (int)e.group().value();
    highlightSelectedAnim(currentIndex);
  }
  if (e.isTab() && e.getTab().getName()=="default" && newAnimName_input.isVisible()) {
    NameAnimationLabel.show(); 
    newAnimName_input.hide();
  }
}

public void new_animation() {
  if (NameAnimationLabel.isVisible()){
    NameAnimationLabel.hide(); 
    newAnimName_input.show();
    newAnimName_input.setFocus(true);
  }
  else {
    NameAnimationLabel.show();
    newAnimName_input.hide();
  }
}

public void newAnimName_input(String theText) {
  int index;
  index = indexAnim;
  listAnimations.addItem(theText, index).setColorBackground(color(0));
  indexAnim++;
  newAnimName_input.hide();
  NameAnimationLabel.show();
}

public void highlightSelectedAnim(int currentIndex){
  ListBoxItem item = listAnimations.getItem(currentIndex);
  NameAnimationLabel.setText(item.getText());
  if(selectedIndex >= 0){//if something was previously selected
    ListBoxItem previousItem = listAnimations.getItem(selectedIndex);//get the item
    previousItem.setColorBackground(colourBG);//and restore the original bg colours
  }
  selectedIndex = currentIndex;//update the selected index
  listAnimations.getItem(selectedIndex).setColorBackground(colourSelected);//and set the bg colour to be the active/'selected one'...until a new selection is made and resets this, like above
}

