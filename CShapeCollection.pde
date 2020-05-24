class CShapeCollection
{
  int _nshapes = 7;
  int _steps[] = {2,2,1,2,2,2,1};
  ArrayList<CShape> _shapes;
  int _selector = 5;
  boolean _pause = true;
  
  // Choose whether to move then pause then move then pause,
  // or for there to be continual movement.
  //
  boolean _wantpausebehaviour = true;
  
  CShapeCollection(float radius)
  {
    _shapes = new ArrayList<CShape>();
    float currentangle = PI * 3/2;
    
    for (int idx = 0; idx < _nshapes; ++idx)
    {
      float deltaangle = _steps[idx] * PI / 6;
      _shapes.add(new CShape(radius, currentangle + deltaangle));
      currentangle = currentangle + deltaangle;
    }    
  }
  
  void changeSelector()
  {
    if (!_wantpausebehaviour || !_pause)
    {
      CShape shape = _shapes.get(_selector);
      shape.addAngle(PI/6);
      
      _selector += 3;
      _selector = _selector % _nshapes;
      
      _pause = true;
    }
    else
    {
      _pause = false;
    }
  }
  
  void display(float time) // time is in the range 0.0 - 1.0 
  {
    if (time == 0)
    {
      changeSelector();
    }

    for (int idx = 0; idx < _nshapes; ++idx)
    {
      float ANGLE = 0;
      if (idx == _selector && (!_wantpausebehaviour || !_pause))
      {
        // Thanks to Matthew for telling me about 'map'.
        // This makes the animated blob accelerate from stationary, 
        // rather than moving at constant speed.
        //
        ANGLE = map(cos(time * PI), 1, -1, 0, PI / 6);
      }

      CShape shape = _shapes.get(idx);
      shape.display(ANGLE);
    }
  }  
}
