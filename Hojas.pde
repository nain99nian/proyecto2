
class Hojas {

  
  Body body;
  float r;

  color col;

  boolean delete = false;

  Hojas (float x, float y, float r_) {
    r = r_;
    
    makeBody(x, y, r);
    body.setUserData(this);
    col = color(#9DCB29);
  }

  
  void change() {
    col = color(#DBAE3C);
  }
 
  void display() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);
   
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-90);
    fill(col);
    stroke(0);
    strokeWeight(1);
    ellipse (0, 0, r*4, r*2);
    
    line(0, 0, r*3, 0);
    popMatrix();
  }

  
  void makeBody(float x, float y, float r) {
    
    BodyDef bd = new BodyDef();
    
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.createBody(bd);

    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = 0.3;

    
    body.createFixture(fd);

    body.setAngularVelocity(random(-10, 10));
  }
}
