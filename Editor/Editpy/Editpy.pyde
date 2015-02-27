add_library('controlP5')


of = PGraphics()

def setup() :

    size(1024,768)
    background(0)
    cp5 = ControlP5(this)
    
    # *****ANIMATIONS*****
    animationsLabel = cp5.addTextlabel("label").setText("ANIMATIONS").setPosition(20,140)
    
    radioAnimSelec = cp5.addRadioButton("Animselection").setPosition(20,160).setSize(20,20).setColorForeground(color(120)).setColorActive(color(255)).setColorLabel(color(255)).setItemsPerRow(1).setSpacingColumn(30)
        
    newAnimButton = cp5.addButton("New Animation").setValue(0).setPosition(20,600).setSize(67,19)
    
    for i in range(1,20):
        j=str(i)
        radioAnimSelec.addItem("Animation_"+j,i)
 
    #***** options elements led, light etc.. *****
    optionsAnimElementLabel = cp5.addTextlabel("optionsAnimElementLabel").setText("LED OPTIONS").setPosition(800,140)
    radioOptionsAnimElement = cp5.addRadioButton("OptionAnimElement").setPosition(800,160).setSize(20,20).setColorForeground(color(120)).setColorActive(color(255)).setColorLabel(color(255)).setItemsPerRow(1).setSpacingColumn(30)
    radioOptionsAnimElement.addItem("on",1)
    radioOptionsAnimElement.addItem("off",2)
    
    #***** Animation main editor *****
    of = createGraphics(560, 420)
    NameAnimationLabel = cp5.addTextlabel("nameAnimElementLabel").setText("Animation Name").setPosition(200,140)

    PreviousKeyFrameButton = cp5.addButton("Previous").setValue(0).setPosition(200,600).setSize(47,19)
    PlayAnimButton = cp5.addButton("play").setValue(0).setPosition(305,600).setSize(30,19)
    SaveAnimButton = cp5.addButton("save").setValue(0).setPosition(410,600).setSize(30,19)
    NextKeyFrameButton = cp5.addButton("Next").setValue(0).setPosition(515,600).setSize(30,19)
    #*****TABS*****
    cp5.addTab("editor")
    cp5.getTab("default").activateEvent(True).setLabel("player").setId(1)
    cp5.getTab("editor").activateEvent(True).setId(2)
   
    #move to tabs
    radioAnimSelec.moveTo("global")
    animationsLabel.moveTo("global")
    newAnimButton.moveTo("editor")
    optionsAnimElementLabel.moveTo("editor")
    radioOptionsAnimElement.moveTo("editor")
    PreviousKeyFrameButton.moveTo("editor")
    SaveAnimButton.moveTo("editor")
    PlayAnimButton.moveTo("editor")
    NextKeyFrameButton.moveTo("editor")
    NameAnimationLabel.moveTo("global")
 

def draw():
    background(0)
    of.beginDraw()
    of.background(100)
    of.stroke(255)
    of.endDraw()
    image(of, 200, 160)


def keyPressed(key) :
    if key == '0': radioAnimSelec.deactivateAll()
    elif key == '1': radioAnimSelec.activate(0)
    elif key == '2': radioAnimSelec.activate(1)
    elif key == '3': radioAnimSelec.activate(2)
    elif key == '4': radioAnimSelec.activate(3)
    elif key == '5': radioAnimSelec.activate(4)



def controlEvent(theEvent):
    if(theEvent.isFrom(radioAnimSelec)):
        print("got an event from ",theEvent.getName(),"\t")
        for i in range(0,theEvent.getGroup().getArrayValue().length):
            print(int(theEvent.getGroup().getArrayValue()[i]))
        print("\t "+theEvent.getValue())


def radioButton(a):
  print("a radio Button event: ",a)

