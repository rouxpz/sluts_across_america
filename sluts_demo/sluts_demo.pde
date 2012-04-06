import processing.video.*;

Movie breanne;
Movie natalie;
Movie phil;
Movie amelia;
Movie ali;

PImage usamap;
PImage banner;
PImage subtitle;
PImage submit;

Cities nyc;
Cities dc;
Cities houston;
Cities sanfran;
Cities neworleans;

void setup () {
  size (1190, 700);
  smooth();
  usamap = loadImage("usamap.png");
  banner = loadImage("banner.png");
  subtitle = loadImage("subtitle.png");
  submit = loadImage("submit.png");
  
  nyc = new Cities(965, 280, 15);
  dc = new Cities(950, 380, 15);
  houston = new Cities(625, 600, 15);
  sanfran = new Cities(200, 400, 15);
  neworleans = new Cities(730, 570, 15);
  
  breanne = new Movie(this, "breanne.mov");
  natalie = new Movie(this, "natalie.mov");
  phil = new Movie(this, "phil.mov");
  amelia = new Movie(this, "amelia.mov");
  ali = new Movie(this, "ali.mov");  
  
}

void movieEvent(Movie movie) {
  breanne.read();
  natalie.read();
  ali.read();
  amelia.read();
  phil.read();
}


void draw () {
  background(119, 194, 211);
  fill(255);
  stroke(0);
  rect(10, 10, 1170, 680);
  
  image(usamap, 149, 122);
  image(banner, 195, 12);
  image(subtitle, 350, 105);
  image(submit, 950, 550);
  nyc.display();
  dc.display();
  houston.display();
  sanfran.display();
  neworleans.display();

  stroke(119, 194, 211);
  strokeWeight(5);
  noFill();
  rect(960, 560, 180, 80);
  stroke(0);
  noFill();
  strokeWeight(2);
  rect(964, 564, 172, 72);
  
  if (mouseX >= nyc.x-15 && mouseX <= nyc.x+15 && mouseY >= nyc.y-15 && mouseY <= nyc.y+15) {
    nyc.r = 20;
    breanne.play();
    image(breanne, mouseX-320, mouseY);
  } else {
    nyc.r = 15;
    breanne.stop();
  }
  
  if (mouseX >= houston.x-15 && mouseX <= houston.x+15 && mouseY >= houston.y-15 && mouseY <= houston.y+15) {
    houston.r = 20;
    natalie.play();
    image(natalie, mouseX, mouseY-240);
  } else {
    houston.r = 15;
    natalie.stop();
  }
  
  if (mouseX >= sanfran.x-15 && mouseX <= sanfran.x+15 && mouseY >= sanfran.y-15 && mouseY <= sanfran.y+15) {
    sanfran.r = 20;
    ali.play();
    image(ali, mouseX, mouseY);
  } else {
    sanfran.r = 15;
    ali.stop();
  }
  
  if (mouseX >= neworleans.x-15 && mouseX <= neworleans.x+15 && mouseY >= neworleans.y-15 && mouseY <= neworleans.y+15) {
    neworleans.r = 20;
    amelia.play();
    image(amelia, mouseX, mouseY-240);
  } else {
    neworleans.r = 15;
    amelia.stop();
  }
  
  if (mouseX >= dc.x-15 && mouseX <= dc.x+15 && mouseY >= dc.y-15 && mouseY <= dc.y+15) {
    dc.r = 20;
    phil.play();
    image(phil, mouseX-320, mouseY-240);
  } else {
    dc.r = 15;
    phil.stop();
  }
}
