import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

ArrayList<Particle> particles;
Attractor attractor;

VerletPhysics2D physics;

void setup()
{
  size(512, 512);
  frameRate(30);
  colorMode(HSB);
  background(255);
  
  physics = new VerletPhysics2D();
  physics.setDrag(0.1);

  particles = new ArrayList<Particle>();
  for(int i = 0; i < 512; i += 1)
  {
    particles.add(new Particle(new Vec2D(random(width * 0.2, width * 0.8 ), random(height * 0.2, height * 0.8))));
  }
  
  attractor = new Attractor(new Vec2D(width / 2, height / 2));
}

void draw()
{
  // background(255);
  
  fill(255, 255);
  noStroke();
  rect(0, 0, width, height);
  
  physics.update();
  
  attractor.compute();
  attractor.disiplay();
  
  for(Particle p : particles)
  {
    p.display();
  }
  
  println(frameCount);
  /*
  saveFrame("screen-#####.png");
  if(frameCount > 1800)
  {
     exit();
  }
  */
}