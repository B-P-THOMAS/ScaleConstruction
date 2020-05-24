// the length of the animation loop in frames
boolean bSaveFrames = false;
final int LOOP_LENGTH = 30;
PShape group;
CShapeCollection shapes;
float spokelength = 200;

// setup is called immediately after the sketch starts
void setup() 
{
  // x, y, drawing mode
  // must be the first call in setup()!
  size(500, 500, P2D);
  shapes = new CShapeCollection(spokelength);
}

// draw is called every frame
void draw() 
{
  final int FRAME = frameCount % LOOP_LENGTH;
  float TIME = FRAME / float(LOOP_LENGTH);  
  
  // float TIME = (float)mouseX/(float)width;
  frame(TIME);
  if (bSaveFrames) 
  {
    saveFrame("out-###.png");
    if (frameCount == LOOP_LENGTH * 12)
      exit();
  }
}

void frame(float TIME) 
{  
  background(240, 240, 240);
  strokeWeight(2);
  ellipse(width/2, height/2, 2 * spokelength, 2 * spokelength);
  ellipse(width/2, height/2, 30, 30);
  
  String[] legends = {
  "C", "B", "Bb", "A", "G#", "G", "F#", "F", "E", "Eb", "D", "C#" 
  };
  
  textSize(32);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  fill(0);
  for (int idx = 0; idx < 12; ++idx)
  {
    float angle = (idx * PI / 6) + (3 * PI / 2);
    float x = ((width/2) - cos(angle)*(spokelength + 30)) ;
    float y =((height/2) + sin(angle)*(spokelength + 30));
    // point(x,y);
    text(legends[idx], x-5, y-5, 50, 50); 
  }
  
  fill(255);
  shapes.display(TIME);
}
