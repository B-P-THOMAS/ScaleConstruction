class CShape 
{
  float _radius;
  float _angle;
  PShape _group;
  color _fill;
  color _stroke;
  
  CShape(float radius, float angle)
  {
    _fill = color(255,255,0);
    _stroke = color(0,0,0);
    
    _radius = radius;
    _angle = angle;
    
    // Create the shape as a group
    //
    _group = createShape(GROUP);
    
    PShape spoke = createShape(LINE, 15 - radius, 0, 0, 0);
    PShape spot = createShape(ELLIPSE, 0, 0, 20, 20);
    
    _group.addChild(spoke); 
    _group.addChild(spot);

    _group.setFill(_fill);
    _group.setStroke(_stroke);
    _group.setStrokeWeight(2);
  }
  
  void addAngle(float angle)
  {
    _angle -= angle;
    _angle = _angle % TWO_PI;
  }
  
  void display(float angle) 
  {
    pushMatrix();
    translate(width/2, height/2);
    rotate(_angle - angle);
    translate(_radius, 0);
    shape(_group); 
    popMatrix();
  }
}
