
void controlEvent(ControlEvent e) {
  println(e);
  
  if(e.name().equals("New animation name")){
    listAnim.newAnimNameinput(listAnim.newAnimName_input.getText());
    listAnim.highlightSelectedAnim(listAnim.indexAnim-1);
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
    if (listAnim instanceof ListAnimation) {
      listAnim.toggleVisibilityNewAnimation();
    }
  }
  if(e.name().equals("for (s)")){
    TESTVAL= keyframe_duration_input.getText();
    print(TESTVAL);
  }
}
