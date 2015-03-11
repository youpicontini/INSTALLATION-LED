
void controlEvent(ControlEvent e) {
  println(e);
  
  if(e.name().equals("NewAnimationName")){
    guiManager.listAnim.newAnimNameinput(guiManager.listAnim.newAnimName_input.getText());
    
    guiManager.listAnim.highlightSelectedAnim(guiManager.listAnim.indexAnim-1);
    if (guiManager.listAnim.indexAnim>35)
      guiManager.listAnim.listAnimations.scroll(1);
  }
  if(e.name().equals("AnimationsList")){
    int currentIndex = (int)e.group().value();
    guiManager.listAnim.highlightSelectedAnim(currentIndex);
  }
  if (e.isTab() && e.getTab().getName()=="default" && guiManager.listAnim.newAnimName_input.isVisible()) {
    guiManager.listAnim.NameAnimationLabel.show(); 
    guiManager.listAnim.newAnimName_input.hide();
  }
  if(e.name().equals("newAnimation")){
    if (guiManager.listAnim instanceof ListAnimation)
      guiManager.listAnim.toggleVisibilityNewAnimation();
  }
  if(e.name().equals("keyframeDurationInput")){
    guiManager.animEditNav.keyframe_duration = Float.parseFloat(guiManager.animEditNav.keyframe_duration_input.getText());
    print(guiManager.animEditNav.keyframe_duration);
  }
  if(e.name().equals("next")){
    if (guiManager.animEditNav instanceof AnimationEditNav)
      guiManager.animEditNav.nextKeyFrame();
  }
  if(e.name().equals("previous")){
    if (guiManager.animEditNav instanceof AnimationEditNav)
      guiManager.animEditNav.previousKeyFrame();
  }
  if(e.name().equals("save")){
    if (guiManager.animEditNav instanceof AnimationEditNav)
      guiManager.animEditNav.saveAnim();
  }
  if(e.name().equals("play")){
    if (guiManager.animEditNav instanceof AnimationEditNav)
      guiManager.animEditNav.playAnim();
  }
}

