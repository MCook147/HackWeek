import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

import nervoussystem.obj.*;

PShape obj;
PShape [] children;

ArrayList <Particle> particles;

import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;


void setup() {
  size(640, 500, P3D);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  obj = loadShape("Beasthead1.obj");
  particles = new ArrayList<Particle>();
  obj.scale(50);
  kinect.initVideo();
}

void draw() {
  background(255);
  
  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();
  image(kinect.getVideoImage(), 0, 240, 320, 240);
  
  lights();
  ambientLight(255, 255, 255); //

  // Let's draw the raw location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  ellipse(v1.x, v1.y, 60, 10);
  translate(v1.x, v1.y, 90);
  
  rotateX(PI);
  rotateY(PI);
  
  beginShape(TRIANGLES);
      for (Particle p : particles) {
      p.display(); // display our run method
      p.update();
      vertex(v1.x, v1.y, 90);
      }
      endShape();
  
  shape(obj);
}

// Adjust the threshold with key presses
void keyPressed() {
  int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t+=5;
      tracker.setThreshold(t);
    } else if (keyCode == DOWN) {
      t-=5;
      tracker.setThreshold(t);
    } else {
    }
  }
}

void mousePressed() {
  
  PVector v1 = tracker.getPos();
  
  for (int i=0; i < 1000; i ++) {
   Particle mini = new Particle(0, v1.x/2, 60);
   particles.add(mini);
  }
  
}