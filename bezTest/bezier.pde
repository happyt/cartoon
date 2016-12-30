float chordLength = 200.0;
PVector ptA = new PVector( 0, 0);
PVector ptB = new PVector( 0, 0);
float angle = 5.0;
float angleStep = 1.0;
PVector a = new PVector( 300, 400);
PVector b = new PVector( 250, 150);
PVector c = new PVector( 700, 400);
PVector d = new PVector( 500, 500);
PVector e = new PVector( 600, 700);
PVector f = new PVector( 750, 300);
PVector g = new PVector( 800, 400);
PVector h = new PVector( 800, 800);
PVector i = new PVector( 820, 700);
PVector pNext = new PVector(0,0);
PVector pNext2 = new PVector(0,0);
PVector pNext3 = new PVector(0,0);
PVector pNext4 = new PVector(0,0);
PImage img;

int dotNumber = 1;
int precision = 30;

PVector[] points;
PVector[] equidistantPoints;

float t = 0.0;
float tStep = 0.004;

final int POINT_COUNT = 80;

int borderSize = 40;

void drawBezier(PVector p1, PVector p2, PVector p3, PVector p4) {
  bezier(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y);
}

void drawCurve(PVector p1, PVector p2, PVector p3, PVector p4) {
  curve(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y);
}

void drawDot(PVector pt) {
  ellipse(pt.x, pt.y, 4, 4);
  textSize(16);
  text(char(96+dotNumber), pt.x - 8, pt.y + 16);
  dotNumber++;
}

void addVertex(PVector pt) {
  curveVertex(pt.x, pt.y);
}
void firstVertex(PVector pt) {
  vertex(pt.x, pt.y);
}

void addBezier(PVector p1, PVector p2, PVector p3) {
  bezierVertex(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
}

void circleStyle() {
  noStroke();
  fill(200, 230, 30);
}

void bezierDraw() {
  //size(1000, 1000, P2D);
 //  background(20, 30, 70);

  smooth(8);
  strokeWeight(1);
  bezierDetail(precision);
  curveDetail(precision);

  // control points
  circleStyle();
  drawDot(a);
  drawDot(b);
  drawDot(c);
  drawDot(d);
  drawDot(e);
  drawDot(f);
  drawDot(g);
  drawDot(h);
  drawDot(i);

//  img = loadImage("colorful.jpg");
//  image(img, 0, 0);
  println("here...");

  stroke(100, 180, 180);
  noFill();
//  fill(88);
  beginShape();
    firstVertex(a); // first point
    addBezier(b, c, d); 
    pNext.x = d.x + (d.x - c.x);
    pNext.y = d.y + (d.y - c.y);
    addBezier(pNext, e, f);
    pNext2.x = f.x + (f.x - e.x);
    pNext2.y = f.y + (f.y - e.y);
    addBezier(pNext2, g, h);
    pNext3.x = h.x + (h.x - g.x);
    pNext3.y = h.y + (h.y - g.y);
    pNext4.x = a.x + (a.x - b.x);
    pNext4.y = a.y + (a.y - b.y);
    addBezier(pNext3, pNext4, a);
  endShape();
  drawDot(pNext);
  drawDot(pNext2);
  drawDot(pNext3);
  drawDot(pNext4);
}