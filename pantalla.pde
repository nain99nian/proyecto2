class fondoPantalla
{
  PImage image;
  int x,y,w,h;
  
  fondoPantalla (int x_, int y_, int w_, int h_)
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }
  
  void display()
  {
    image = loadImage("fondo.jpg");
    image (fondo,x,y,w,h);
  }
}
