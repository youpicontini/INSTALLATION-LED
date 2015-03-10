class OptionAnimation {
  
  Textlabel optionsAnimElementLabel;
  Slider opacAnimElement;
  
  OptionAnimation(ControlP5 cp5){
     optionsAnimElementLabel = cp5.addTextlabel("optionsAnimElementLabel")
                                  .setText("LED OPTIONS")
                                  .setPosition(1260,40)
                                  .setGroup("optionElementGroup");
     opacAnimElement = cp5.addSlider("slideropacity")
                          .setValue(100)
                          .setPosition(1260,60)
                          .setRange(0,100)
                          .setGroup("optionElementGroup");
  }
}

