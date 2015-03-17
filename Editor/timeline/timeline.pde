import java.awt.event.*;
PFont font;
int timeBegin = 0;
int timeEnd = 5;
int periodCenter = (timeEnd-timeBegin)/2;//Point in timeline on which to center view
int yearModulate = 10;
int zoomLevel =5;//25/3
int upTick;
PImage img;
float y_timeline;

//Mouse Dragging
protected float   mX;
protected float mY;
protected float   mDifX = 0f;
//protected float   mDifY = 0f;
 
void setup() {
  size(800, 500);
  smooth();
  img = loadImage("img.jpg");
  //CENTER ON SPECIFIED DATE
  mX = map(periodCenter, 0, timeEnd - timeBegin, width/2 - 200*zoomLevel, 200*zoomLevel)*-1;
  println(mX);
  y_timeline=height/2;
  addMouseWheelListener(new MouseWheelListener() {
    public void mouseWheelMoved(MouseWheelEvent mwe) {
      mouseWheel(mwe.getWheelRotation());
    }
  }
  );
}
 
void draw() {
  background(0);
  stroke(100);
  line(0, y_timeline, width,y_timeline);
  mX = constrain(mX, width/2 - 200*zoomLevel, -width/2 + 200*zoomLevel);
  
  translate(mX, mY);
  float yearTick0init = map(0, 0, timeEnd, width/2 - 200*zoomLevel, width/2 + 200*zoomLevel);
  println("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"+yearTick0init);
  for (int i = 0; i < timeEnd - timeBegin; i++){
    float yearTick0 = map(i, 0, timeEnd, width/2 - 200*zoomLevel, width/2 + 200*zoomLevel);
    float yearTick1 = map(i+1, 0, timeEnd, width/2 - 200*zoomLevel, width/2 + 200*zoomLevel);
    upTick = 50;
    if (i%2 == 0)fill(255);
    else fill(150);
    rect(yearTick0, height/2 - upTick/2, yearTick1-i*yearTick0init, upTick);
    noFill();
    //image(img,yearTick0, height/2 - upTick/2, upTick,upTick);
    line(yearTick0, height/2 - upTick, yearTick0, height/2 + upTick);
    if(i==0)text("FIRST", yearTick0,height/2 + upTick);
    else if(i==(timeEnd - timeBegin-1))text("LAST", yearTick0,height/2 + upTick);
    else {text(i, yearTick0,height/2 + upTick);}
    println(mouseX,i, (int)yearTick0+"/"+(int)yearTick1,(int)yearTick1-(int)yearTick0,zoomLevel, width);
  }
}
 
 
void mouseWheel(int delta) {
  if ((mouseY > (height/2 - upTick)) && (mouseY < (height/2 + upTick)) && (width>upTick)){
    zoomLevel = zoomLevel + delta;
    zoomLevel = constrain(zoomLevel, 2, 15);
    println(delta ,zoomLevel);
  }
}
 
void mousePressed() {
  mDifX = mouseX - mX;
  //mDifY = mouseY - mY;
  cursor(HAND);
}
 
void mouseReleased() {
  cursor(ARROW);
}
 
void mouseDragged() {
  if ((mouseY > (height/2 - upTick)) && (mouseY < (height/2 + upTick))){
    mX = mouseX - mDifX;
    println(mX);
    //mY = mouseY - mDifY;
  }
}

