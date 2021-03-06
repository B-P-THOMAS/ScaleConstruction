class CShape 
{
  float _radius;
  float _angle;
  PShape _group;
  color _fill; 
      
  // CShape is a horizontal spoke with a circular blob 
  // at the right-hand end. We transform these by rotation
  // and scaling at display time.
  //
  CShape(float radius, float angle)
  {
    _fill = color(220,220,0);
    color stroke = color(0,0,0);
    
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
    _group.setStroke(stroke);
    _group.setStrokeWeight(2);
  }
  
  void setFill(color c)
  {
    _fill = c;
    _group.setFill(_fill);
  }
  
  color getFill()
  {
    return _fill;
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
