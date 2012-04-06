class Cities {
  float x;
  float y;
  float r;
  
  Cities(float tempX, float tempY, float tempR) {
    x = tempX;
    y = tempY; 
    r = tempR;
  }
  
  void display() {
    stroke(0);
    strokeWeight(3);
    fill(255, 0, 0);
    ellipse(x, y, r, r);    
  }  
}
