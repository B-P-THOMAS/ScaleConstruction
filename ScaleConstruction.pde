// the length of the animation loop in frames
//
final int LOOP_LENGTH = 50;

boolean bSaveFrames = false;
CShapeCollection shapes;
float spokelength = 200;

// setup is called immediately after the sketch starts
//
void setup() 
{
  // x, y, drawing mode
  // must be the first call in setup()!
  //
  size(500, 500, P2D);
  shapes = new CShapeCollection(spokelength);
}

// draw is called every frame
//
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

void bezel(int degree) // 0 is C, 1 is B, 2 is Bb and so on.
{
  background(240, 240, 240);
  strokeWeight(2);
  ellipse(width/2, height/2, 2 * spokelength, 2 * spokelength);
  ellipse(width/2, height/2, 30, 30);
    
  boolean[] use_sharps =    {false, true,  false,  true,  false,  true,  true,   false, true,  false,  true,  true}; 
  String[] legends_sharps = {"C",   "B",   "A#",   "A",   "G#",   "G",   "F#",   "F",   "E",   "D#",   "D",   "C#"};
  String[] legends_flats =  {"C",   "B",   "Bb",   "A",   "Ab",   "G",   "Gb",   "F",   "E",   "Eb",   "D",   "Db"};
  String[] legends;
  
  if (use_sharps[degree])
  {
    legends = legends_sharps;
  }
  else
  {
    legends = legends_flats;
  }
    
  textSize(32);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  fill(0);
  for (int idx = 0; idx < 12; ++idx)
  {
    float angle = (idx * PI / 6) + (3 * PI / 2);
    float x = ((width/2) - cos(angle)*(spokelength + 30)) ;
    float y =((height/2) + sin(angle)*(spokelength + 30));
    text(legends[idx], x-5, y-5, 50, 50); 
  }
}

void frame(float TIME) 
{  
  bezel(2);
  fill(255);
  shapes.display(TIME);
}
