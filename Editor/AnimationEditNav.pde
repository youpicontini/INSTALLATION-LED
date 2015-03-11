

class AnimationEditNav {
  int nav_grp_y = 810;
  int nav_grp_x = 200;
  float keyframe_duration = 0.5;
  
  Button SaveKeyframeButton;
  Button PreviousKeyFrameButton;
  Button NextKeyFrameButton;
  Button PlayAnimButton;
  Button SaveAnimButton;
  Textfield keyframe_duration_input;
  Textlabel keyframe_name;
    
  AnimationEditNav(ControlP5 cp5){
    
    keyframe_name = cp5.addTextlabel("keyframe_num")
                       .setText("keyframe_num")
                       .setPosition(nav_grp_x,nav_grp_y)
                       .setGroup("keyframEditGroup");
    keyframe_duration_input = cp5.addTextfield("keyframeDurationInput")
                                 .setLabel("for (s)")
                                 .setPosition(nav_grp_x,nav_grp_y+20)
                                 .setSize(50,30)
                                 .setFocus(true)
                                 .setGroup("keyframEditGroup")
                                 .setValue(keyframe_duration)
                                 .setText(""+keyframe_duration);
    PreviousKeyFrameButton = cp5.addButton("previous")
                                .setLabel("previous (<-)")
                                .setValue(0)
                                .setPosition(nav_grp_x+100,nav_grp_y+20)
                                .setGroup("keyframNavGroup")
                                .setSize(100,40);
    PlayAnimButton = cp5.addButton("play")
                        .setLabel("play (p)")
                        .setValue(0)
                        .setPosition(nav_grp_x+250,nav_grp_y+20)
                        .setGroup("keyframNavGroup")
                        .setSize(100,40);
    SaveAnimButton = cp5.addButton("save")
                        .setLabel("save (s)")
                        .setValue(0)
                        .setPosition(nav_grp_x+400,nav_grp_y+20)
                        .setGroup("keyframNavGroup")
                        .setSize(100,40);
    NextKeyFrameButton = cp5.addButton("next")
                            .setLabel("next (->)")
                            .setValue(0)
                            .setPosition(nav_grp_x+550,nav_grp_y+20)
                            .setGroup("keyframNavGroup")
                            .setSize(100,40);
  }
  void nextKeyFrame(){
    print("next");
  }
  void previousKeyFrame(){
    print("prev");
  }
  void playAnim(){
    print("play");
  }
  void saveAnim(){
    print("save");
  }
}
