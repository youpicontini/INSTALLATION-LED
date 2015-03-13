class Keyframe{
  
 JSONObject keyframe;
  Keyframe(String nameAnim, int kfnum){

    keyframe = new JSONObject();
    keyframe.setInt("id", 0);
    keyframe.setString("species", "Panthera leo");
    keyframe.setString("name", "Lion");
  
    saveJSONObject(keyframe, "animations/"+nameAnim+"/keyframes/keyframe"+kfnum+".json");
  }
}
