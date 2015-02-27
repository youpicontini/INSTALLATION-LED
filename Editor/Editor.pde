import controlP5.*;


ControlP5 cp5;
Textlabel animationsLabel;
RadioButton radioAnimSelec;

Textlabel optionsAnimElementLabel;
RadioButton radioOptionsAnimElement;
Button newAnimButton;
Canvas AnimationEditorMain;
Textlabel NameAnimationLabel;

PGraphics of;
Button PreviousKeyFrameButton;
Button NextKeyFrameButton;
Button PlayAnimButton;
Button SaveAnimButton;
Textlabel keyframe_name;
Textfield keyframe_begin_input;
Textfield keyframe_end_input;
Button SaveKeyframeButton;


void setup() {

  size(1024,768);
  background(0);
  cp5 = new ControlP5(this);
  
  
  // *****ANIMATIONS*****
  Group animationsGroup = cp5.addGroup("Animations")
                          ;
  animationsLabel = cp5.addTextlabel("label")
                    .setText("ANIMATIONS")
                    .setPosition(20,140)
                    .setGroup("Animations");  
  
  radioAnimSelec = cp5.addRadioButton("Animselection")
                    .setPosition(20,160)
                    .setSize(20,20)
                    .setColorForeground(color(120))
                    .setColorActive(color(255))
                    .setColorLabel(color(255))
                    .setItemsPerRow(1)
                    .setSpacingColumn(30)
                    .setGroup("Animations");
  
  newAnimButton = cp5.addButton("New Animation")
                   .setValue(0)
                   .setPosition(20,600)
                   .setSize(67,19)
                   .setGroup("Animations");
     
  for(int i=0;i<20;i++){
    radioAnimSelec.addItem("Animation_"+i,i);
  }
  
  
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
                        .setText("Animation Name")
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
                        
  keyframe_end_input = cp5.addTextfield("until (s)")
                       .setPosition(280,600)
                       .setSize(50,15)
                       .setFocus(true)
                       .setGroup("keyframEditGroup"); 

  cp5.getTooltip().setDelay(0).register("until (s)","if blank, the default value will be the starting time of the next keyframe");
  
  SaveKeyframeButton = cp5.addButton("save keyframe")
                       .setValue(0)
                       .setPosition(350,600)
                       .setSize(80,19)
                       .setGroup("keyframEditGroup"); 
  
  PreviousKeyFrameButton = cp5.addButton("Previous")
                           .setValue(0)
                           .setPosition(200,640)
                           .setSize(47,19)
                           .setGroup("keyframEditGroup"); 
                             
  PlayAnimButton = cp5.addButton("play")
                   .setValue(0)
                   .setPosition(305,640)
                   .setSize(30,19)
                   .setGroup("keyframEditGroup"); 
       
  SaveAnimButton = cp5.addButton("save")
                   .setValue(0)
                   .setPosition(410,640)
                   .setSize(30,19)
                   .setGroup("keyframEditGroup"); 
       
  NextKeyFrameButton = cp5.addButton("Next")
                       .setValue(0)
                       .setPosition(515,640)
                       .setSize(30,19)
                       .setGroup("keyframEditGroup"); 
       
   
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


void keyPressed() {
  switch(key) {
    case('0'): radioAnimSelec.deactivateAll(); break;
    case('1'): radioAnimSelec.activate(0); break;
    case('2'): radioAnimSelec.activate(1); break;
    case('3'): radioAnimSelec.activate(2); break;
    case('4'): radioAnimSelec.activate(3); break;
    case('5'): radioAnimSelec.activate(4); break;
  }
  
}


void controlEvent(ControlEvent theEvent) {
  if(theEvent.isFrom(radioAnimSelec)) {
    print("got an event from "+theEvent.getName()+"\t");
    for(int i=0;i<theEvent.getGroup().getArrayValue().length;i++) {
      print(int(theEvent.getGroup().getArrayValue()[i]));
    }
    println("\t "+theEvent.getValue());
  }
}

void radioButton(int a) {
  println("a radio Button event: "+a);
}


