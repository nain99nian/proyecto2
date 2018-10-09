
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


Box2DProcessing box2d;

fondoPantalla pantalla;


ArrayList<Hojas> hojitas;


Limites wall, wall2,wall3,wall4;

int value=0;

PImage fondo, flecha, flecha2;

void setup() {
  size(300, 600);
  smooth();

  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  
  box2d.listenForCollisions();
  box2d.setGravity(0,0);

 
  hojitas = new ArrayList<Hojas>();
  
  pantalla = new fondoPantalla (0,0,width,height);
  

  wall = new Limites(width/2, height-5, width, 10);
  wall2 = new Limites(width/2, height/8, width, 10);
  wall3 = new Limites(30,300,10,height);
  wall4 = new Limites(250,300,10,height);
  
  fondo = loadImage ("fondo.jpg");
  flecha = loadImage ("flecha.jpg");
  flecha2 = loadImage ("flecha2.jpg");
  
  for (int i=0; i<50; i++)
  {
    hojitas.add (new Hojas (random(60,230),random(90,330),random(10)));
  }
 
}

void draw() {
  background(255);
  
  pantalla.display();
  
  image (fondo,0,0,width,height);
  image (flecha2,10,500,40,90);
  image (flecha,250,500,40,90);

  box2d.step();

  
  
  for (Hojas p: hojitas)
  {
    p.display();
    noFill();
    stroke(255,0,0);
    rect (10,500,40,90);
    rect (250,500,40,90);
    if (mousePressed && (mouseX>=10) && (mouseX<=10+40) && (mouseY>=500) && (mouseY<=500+90))
    {
      box2d.setGravity(0,-10);
    }
    if (mousePressed && (mouseX>=250) && (mouseX<=250+40) && (mouseY>=500) && (mouseY<=500+90))
    {
     
      box2d.setGravity(0,10);
    }
  }
  

 /* wall.display();
  wall2.display();
  wall3.display();
  wall4.display();*/
}



void beginContact(Contact cp) {
 
  Fixture f1 = cp.getFixtureA();
 
  Body b1 = f1.getBody();

  
  Object o1 = b1.getUserData();



  if (o1.getClass() == Limites.class) {
    Hojas p = (Hojas) o1;
    p.change();
  }



}


void endContact(Contact cp) {
}
