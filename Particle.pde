class Particle extends VerletParticle2D
{
  float r;
  color bodyColor;
  
  Particle(Vec2D loc)
  {
    super(loc);
    r = 4;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r * 4, -1));
    
    bodyColor = color(random(255), 255, 255);
  }
  
  void display()
  {    
    fill(bodyColor);
    noStroke();
    ellipse(x, y, r * 2, r * 2);
  }
}