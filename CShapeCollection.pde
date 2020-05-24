class CShapeCollection
{
  int _nshapes = 7;
  int _steps[] = {2,2,1,2,2,2,1};
  ArrayList<CShape> _shapes;
  int _selector = 5;
  int _initialpause = 5;
  int _pause = _initialpause;
  int _bezelselector = 0;
  
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
      CShape shape = new CShape(radius, currentangle + deltaangle);
      if (idx == 6)
      {
        shape.setFill(color(255,0,0));
      }
      _shapes.add(shape);
      currentangle = currentangle + deltaangle;
    }    
  }
  
  void changeSelector()
  {
    if (!_wantpausebehaviour || _pause == 0)
    {
      if (_selector == 6)
      {
        _bezelselector ++;
        if (_bezelselector == 12)
        {
          _bezelselector = 0;
        }
      }
      
      CShape shape = _shapes.get(_selector);
      shape.addAngle(PI/6);
      
      _selector += 3;
      _selector = _selector % _nshapes;
      
      _pause = _initialpause;
    }
    else
    {
      --_pause;
    }
  }
  
  void display(float time) // time is in the range 0.0 - 1.0 
  {
    if (time == 0)
    {
      changeSelector();
    }

    bezel(_bezelselector);
    
    for (int idx = 0; idx < _nshapes; ++idx)
    {
      float ANGLE = 0;
      if (idx == _selector && (!_wantpausebehaviour || _pause == 0))
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
