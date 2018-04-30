class Particle{
  
  float x;
  float y;
  float z;
  float r,g,b;
  float t;
  
  PVector vel;
  PVector acc;
  PVector loc;
  
  color c;
  
  Particle(float px, float py, float pz) {
    
    x = px;
    y = py;
    z = pz;
    
    r = random(0,255);
    g = random(0,255);
    b = random(0,255);
    
    acc = new PVector(0,0,0);
    vel = new PVector(random(-5,5), random(-5, 5), random(-5, 5));
    loc = new PVector(x,y,z);
    
    //c = img.get(int(loc.x), int(loc.y));
  }
 
 void update() {
  //x = x + random(-5,5);
  //y = y + random(-5,5);
  
  vel.add(acc); // Add push to direction
  
  // Motion Algorithm
  PVector r = PVector.random3D();
  r.mult(0.85); // Wiggle
  vel.add(r);
  
  loc.add(vel); // Update location to reflect forces added
  acc.mult(0);
 }
 
 void display() {
   noStroke();
   
   t = random(30,60);
   //color c = img.get(int(loc.x), int(loc.y));
   fill(40, 40, 40, t);
   //stroke(285, 285, 285, 40);
   
   
   PVector v1 = tracker.getPos();
    
   //point(loc.x, loc.y, loc.z);
   ellipse(loc.x, loc.y, loc.z, 80);
   noFill();
   pushMatrix(); 
   translate(v1.x, v1.y, 60);
   //sphere(25);
   popMatrix();
 }
 
}