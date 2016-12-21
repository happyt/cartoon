
float[] x;
float[] y = 


void setup() {
  size(640, 360);
  background(100);
    stroke(255);
  fill(100);
  drawCircle(100,100,50, 2.0);

}

void draw() {

  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    println(mouseX, mouseY);
  }
}



void drawCircle(int cx, int cy,int radius, float var) {
 
  float x = 0;
  float y = 0;
  float xl = x;
  float yl = y;
  noFill();
  beginShape();
    x = cx + (randomGaussian() -.5) * var - radius;
    xl=x;
    y = cy + (randomGaussian() -.5) * var + radius;
    yl=y;
    ellipse(x,y,5,5);
    curveVertex(x, y);
    curveVertex(x, y);
    x = cx + (randomGaussian() -.5) * var - radius;
    y = cy + (randomGaussian() -.5) * var;
    ellipse(x,y,5,5);
    curveVertex(x, y);
    x = cx + (randomGaussian() -.5) * var;
    y = cy + (randomGaussian() -.5) * var - radius;
    ellipse(x,y,5,5);
    curveVertex(x, y);
    x = cx + (randomGaussian() -.5) * var + radius;
    y = cy + (randomGaussian() -.5) * var;
    ellipse(x,y,5,5);
    curveVertex(x, y);
    x = cx + (randomGaussian() -.5) * var;
    y = cy + (randomGaussian() -.5) * var + radius;
    ellipse(x,y,5,5);
    curveVertex(x,  y);
    x = cx + (randomGaussian() -.5) * var - radius;
    y = cy + (randomGaussian() -.5) * var + 2;    
    ellipse(x,y,5,5);
    curveVertex(xl,  yl);
    curveVertex(xl,  yl);
  endShape();
  beginShape();
    vertex(200,50);
    bezierVertex(240, 50, 280, 50, 320, 100);
    bezierVertex(320, 100, 280, 100, 240, 50);
  endShape();