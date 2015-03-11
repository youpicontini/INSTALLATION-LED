


class GuiManager{
    
  OptionAnimation optAnim;
  ListAnimation listAnim;
  AnimationEditNav animEditNav;
  
  Textlabel Project_name;
  Textlabel frameRate_project;

  GuiManager(ControlP5 cp5){

    //****************Groups***** 
    Group animationsGroup = cp5.addGroup("Animations");
    Group optionElementGroup = cp5.addGroup("optionElementGroup");
    Group keyframEditGroup = cp5.addGroup("keyframEditGroup");
    Group keyframNavGroup = cp5.addGroup("keyframNavGroup");
    //*****TABS*****
    cp5.addTab("editor");
    cp5.getTab("default")
       .activateEvent(true)
       .setLabel("player")
       .setId(1);
  
    cp5.getTab("editor")
       .activateEvent(true)
       .setId(2);
    
    // *****ANIMATIONS*****
    optAnim = new OptionAnimation(cp5);
    listAnim = new ListAnimation(cp5);
    animEditNav = new AnimationEditNav(cp5);
    // ******Project Details
    Project_name = cp5.addTextlabel("projectname")
                      .setText(PROJECTNAME)
                      .setPosition(880,20)
                      .setColor(0xff000000)
                      .setFont(createFont("",30));
    
    frameRate_project = cp5.addTextlabel("framerate")
                      .setPosition(800,20)
                      .setFont(createFont("",30));
    
   //move to tabs
    optionElementGroup.moveTo("editor");
    animationsGroup.moveTo("global");
    Project_name.moveTo("global");
    listAnim.newAnimButton.moveTo("editor");
    keyframEditGroup.moveTo("editor");
    keyframNavGroup.moveTo("editor");
    listAnim.NameAnimationLabel.moveTo("global");
  }
  
  void draw(){
    frameRate_project.setText(""+Math.round(frameRate)).setColor(0xff000000);
    if (frameRate<25)frameRate_project.setColor  (0xffff0000);
  }
}
