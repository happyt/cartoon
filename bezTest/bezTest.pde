boolean debug = false;

void setup() {
  size(640, 640);
  background(100);
  stroke(255);
  fill(100);
  noFill();
  printEyes(250, 250, 50, 20, 8.0, 15.0);
  printEyes(450, 250, 50, 20, 4.0, 25.0);
  if (debug) testRotate();
}
   
  void testRotate() {
  float cx = 200;
  float cy = 100;
  float ht = 50;
   ellipse(cx, cy, 5, 5);
   ellipse(cx, cy - ht, 5, 5);
  float ex = rotateX(cx, cy, cx, cy - ht, 10);
  float ey = rotateY(cx, cy, cx, cy - ht, 10);
  ellipse(ex, ey, 4, 4);
  ex = rotateX(cx, cy, cx, cy - ht, 20);
  ey = rotateY(cx, cy, cx, cy - ht, 20);
  ellipse(ex, ey, 3, 3);
  ex = rotateX(cx, cy, cx, cy - ht, 30);
  ey = rotateY(cx, cy, cx, cy - ht, 30);
  ellipse(ex, ey, 3, 3);
  ex = rotateX(cx, cy, cx, cy - ht, 40);
  ey = rotateY(cx, cy, cx, cy - ht, 40);
  ellipse(ex, ey, 2, 2);
  ex = rotateX(cx, cy, cx, cy - ht, 50);
  ey = rotateY(cx, cy, cx, cy - ht, 50);
  ellipse(ex, ey, 2, 2);
}

void printEyes(int cx, int cy, float apart, float size, float var, float angle) {
  float ratio = 1.3;
  float iris = size/2;
  printRound(cx - apart/2, cy, size, ratio, angle, var);
  printRound(cx + apart/2, cy, size, ratio, angle, var);
  if (debug) {
     ellipse(cx - apart/2, cy + size/2, 4, 2);
     ellipse(cx + apart/2, cy + size/2, 4, 2);
  }
  float ex = rotateX(cx - apart/2, cy, cx - apart/2, cy + size/2, angle);
  float ey = rotateY(cx - apart/2, cy, cx - apart/2, cy + size/2, angle);
  ellipse(ex + w(var), ey + w(var), iris, iris);
  ex = rotateX(cx + apart/2, cy, cx + apart/2, cy + size/2, angle);
  ey = rotateY(cx + apart/2, cy, cx + apart/2, cy + size/2, angle);
  ellipse(ex + w(var), ey + w(var), iris, iris);
} 


float rotateX(float cx, float cy, float px, float py, float d) {
  return cx - (px-cx)*cos(radians(-d)) + (py-cy)*sin(radians(-d));
}
float rotateY(float cx, float cy, float px, float py, float d) {
  return cy - (px-cx)*sin(radians(d)) + (py-cy)*cos(radians(d));
}

//wobble, can be negative, around zero
float w(float amount) {
    return random(amount)-amount/2;
}

void printRound(float cx, float cy, float size, float ratio, float angle, float var) {
  ArrayList ptsA = new ArrayList();
  ArrayList pts = new ArrayList();
  PVector point ;
  
  // set the 6 outer control points
  
  // rotation
  // newX = centerX + (pointx-centerX)*Math.cos(x) - (pointy-centerY)*Math.sin(x);
  // newY = centerY + (pointx-centerX)*Math.sin(x) + (pointy-centerY)*Math.cos(x);
  
  float rx = rotateX(cx, cy, cx-size, cy, angle);
  float ry = rotateY(cx, cy, cx-size, cy, angle);
  // test
  // ellipse(rx, ry, 5, 5);
  point = new PVector(rx, ry);
  pts.add(point);
  
  point = new PVector(cx - size, cy);
  ptsA.add(point);
  
  rx = rotateX(cx, cy, cx-size, cy-size*ratio, angle);
  ry = rotateY(cx, cy, cx-size, cy-size*ratio, angle);
  point = new PVector(rx, ry);
  pts.add(point);
  point = new PVector(cx - size, cy - size * ratio);
  ptsA.add(point);
  
  rx = rotateX(cx, cy, cx+size, cy-size*ratio, angle);
  ry = rotateY(cx, cy, cx+size, cy-size*ratio, angle);
  point = new PVector(rx, ry);
  pts.add(point);
  point = new PVector(cx + size, cy - size * ratio);
  ptsA.add(point);

  rx = rotateX(cx, cy, cx+size, cy, angle);
  ry = rotateY(cx, cy, cx+size, cy, angle);
  point = new PVector(rx, ry);
  pts.add(point);
  point = new PVector(cx + size, cy);
  ptsA.add(point);
  
  rx = rotateX(cx, cy, cx+size, cy+size*ratio, angle);
  ry = rotateY(cx, cy, cx+size, cy+size*ratio, angle);
  point = new PVector(rx, ry);
  pts.add(point);
  point = new PVector(cx + size, cy + size * ratio);
  ptsA.add(point);

  rx = rotateX(cx, cy, cx-size, cy+size*ratio, angle);
  ry = rotateY(cx, cy, cx-size, cy+size*ratio, angle);
  point = new PVector(rx, ry);
  pts.add(point);
  point = new PVector(cx - size, cy + size * ratio);
  ptsA.add(point);
  if (debug) {
    for (int i = 0; i<pts.size(); i++){
        PVector pp = (PVector) pts.get(i); //ArrayLists don't know what they store, so we remind it.
        ellipse(pp.x, pp.y, 3, 3);
    }
    
    for (int i = 0; i<ptsA.size(); i++){
        PVector pp = (PVector) ptsA.get(i); //ArrayLists don't know what they store, so we remind it.
        ellipse(pp.x, pp.y, 5, 5);
    }
  } 
  
  beginShape();
  PVector p0 = (PVector)pts.get(0);
  PVector p1 = (PVector)pts.get(1);
  PVector p2 = (PVector)pts.get(2);
  PVector p3 = (PVector)pts.get(3);
  PVector p4 = (PVector)pts.get(4);
  PVector p5 = (PVector)pts.get(5);
  vertex(p0.x + w(var), p0.y + w(var));
  float midwx = w(var);
  float midwy = w(var);
  bezierVertex(p1.x + w(var), p1.y + w(var), p2.x + w(var), p2.y + midwx, p3.x + midwy, p3.y + w(var));
  bezierVertex(p4.x - midwx, p4.y - midwy, p5.x + w(var), p5.y + w(var), p0.x + w(var), p0.y + w(var));
  endShape();
}