
class Animation {
  
  Keyframe keyframe;
  int indexKeyframe=0;
  String name;
  ArrayList<Keyframe> keyframesArray;
  
  Animation (String name) {
    this.name = name;
    keyframesArray = new ArrayList<Keyframe>();
  }
  
  void addKeyframe(){
    keyframe = new Keyframe(name, indexKeyframe);
    keyframesArray.add(keyframe);
    indexKeyframe++;
  }
  
  void removeKeyframe(int index){
    keyframesArray.remove(index);
    indexKeyframe--;
  }
}
