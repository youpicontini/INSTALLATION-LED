class OptionAnimation {
  
  Textlabel optionsAnimElementLabel;
  Slider opacAnimElement;
  
  OptionAnimation(ControlP5 cp5){
     optionsAnimElementLabel = cp5.addTextlabel("optionsAnimElementLabel")
                                  .setText("LED OPTIONS")
                                  .setPosition(800,140)
                                  .setGroup("optionElementGroup");
     opacAnimElement = cp5.addSlider("slideropacity")
                          .setValue(100)
                          .setPosition(800,160)
                          .setRange(0,100)
                          .setGroup("optionElementGroup");
  }
}

