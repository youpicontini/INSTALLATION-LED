boolean pressingP=false;
boolean pressingS=false;
boolean pressingCTRL=false;

void keyPressed()
{
  if (key == CODED) {
    if (keyCode == LEFT) {
      guiManager.animEditNav.previousKeyFrame();
    } 
    else if (keyCode == RIGHT) {
      guiManager.animEditNav.nextKeyFrame();
    }
  }
  if (key == CODED ){if(keyCode == CONTROL)pressingCTRL=true;}
  if(key=='p')pressingP=true;
  if(key=='s')pressingS=true;
    
  if( pressingP && pressingCTRL) guiManager.animEditNav.playAnim();
  if( pressingS && pressingCTRL) guiManager.animEditNav.saveAnim();;
}

void keyReleased()
{
  if(key=='p')pressingP = false;  
  if(key=='s')pressingS = false;
  if ((key == CODED )&&(keyCode == CONTROL)) pressingCTRL = false;
}
