void setup() {
  size(640, 360);
  background(100);
    stroke(255);
  fill(100);
    noFill();
  printRound(150, 150, 30, 2, 0, 1.0);
}

void printRound(int cx, int cy, int size, float ratio, int angle, float var) {
  ArrayList pts = new ArrayList();
  PVector point = new PVector(cx - size, cy);
  pts.add(point);
  point = new PVector(cx - size, cy - size * ratio);
  pts.add(point);
  point = new PVector(cx + size, cy - size * ratio);
  pts.add(point);
  point = new PVector(cx + size, cy);
  pts.add(point);
  point = new PVector(cx + size, cy + size * ratio);
  pts.add(point);
  point = new PVector(cx - size, cy + size * ratio);
  pts.add(point);
  
  for (int i = 0; i<pts.size(); i++){
      PVector pp = (PVector) pts.get(i); //ArrayLists don't know what they store, so we remind it.
      ellipse(pp.x, pp.y, 5, 5);
 }
 
  beginShape();
  PVector p0 = (PVector)pts.get(0);
  PVector p1 = (PVector)pts.get(1);
  PVector p2 = (PVector)pts.get(2);
  PVector p3 = (PVector)pts.get(3);
  PVector p4 = (PVector)pts.get(4);
  PVector p5 = (PVector)pts.get(5);
  vertex(p0.x, p0.y);
  bezierVertex(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
  bezierVertex(p4.x, p4.y, p5.x, p5.y, p0.x, p0.y);
  endShape();
}