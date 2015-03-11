class Keyframe{
  
 JSONObject keyframe;
  Keyframe(String nameAnim, String kfnum){

    keyframe = new JSONObject();
    keyframe.setInt("id", 0);
    keyframe.setString("species", "Panthera leo");
    keyframe.setString("name", "Lion");
  
    saveJSONObject(keyframe, "animations/"+nameAnim+"/keyframe"+kfnum+".json");
  }
}
