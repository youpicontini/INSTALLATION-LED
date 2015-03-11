class ListAnimation {
  
  ListBox listAnimations;
  Button newAnimButton;
  Textlabel NameAnimationLabel;
  Textfield newAnimName_input;
  
  int indexAnim;
  int selectedIndex;//no selection initially
  int colorBG = color(0);
  int colorSelected = color(150);
  
  ListAnimation(ControlP5 cp5){
    
    indexAnim = 0;
    selectedIndex = -1;
    
    newAnimButton = cp5.addButton("newAnimation")
                       .setLabel("new animation")
                       .setValue(0)
                       .setPosition(20,830)
                       .setSize(170,20)
                       .setGroup("Animations");
                       
    newAnimName_input = cp5.addTextfield("NewAnimationName")
                           .setLabel("new animation name")
                           .setPosition(200,20)
                           .setSize(170,20)
                           .setFocus(true)
                           .setGroup("Animations")
                           .hide();
    listAnimations = cp5.addListBox("AnimationsList")
                        .setPosition(20,80)
                        .setSize(170, 740)
                        .setItemHeight(20)
                        .setBarHeight(20)
                        .setColorBackground(color(50))
                        .setColorActive(color(150))
                        .setColorForeground(color(150))
                        .setGroup("Animations");
  
    listAnimations.captionLabel().toUpperCase(true)
                                 .set("Animations")
                                 .setColor(color(150));
    listAnimations.captionLabel().style().marginTop = 5;
      
    NameAnimationLabel = cp5.addTextlabel("nameAnimElementLabel")
                          .setText("Choose Animation")
                          .setPosition(200,40);
  }
  
  public void toggleVisibilityNewAnimation() {
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

  public void newAnimNameinput(String theText) {
    listAnimations.addItem(theText, indexAnim).setColorBackground(color(0));
    indexAnim++;
    newAnimName_input.hide();
    NameAnimationLabel.show();
  }

  public void highlightSelectedAnim(int currentIndex){
    ListBoxItem item = listAnimations.getItem(currentIndex);
    NameAnimationLabel.setText(item.getText());
    if(selectedIndex >= 0){//if something was previously selected
      ListBoxItem previousItem = listAnimations.getItem(selectedIndex);//get the item
      previousItem.setColorBackground(colorBG);//and restore the original bg colours
    }
    selectedIndex = currentIndex;//update the selected index
    listAnimations.getItem(selectedIndex).setColorBackground(colorSelected);//and set the bg colour to be the active/'selected one'...until a new selection is made and resets this, like above
  }
}

