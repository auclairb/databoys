PShape doctor;
PShape language;
PShape politician;
PShape lawyer;
PShape biz;

PFont f;
PFont bold_f;

String s = "of positive answers after the first date";

boolean menOver = false;
boolean womenOver = false;
boolean bothOver = false;

//Gauge cross = new Gauge(100,100,23.,"bla","bla","cross.svg",100,100);

void setup() {
  size(1280, 1024);
  background(255, 255, 255);
  f = createFont("Arial", 16, true);
  bold_f = createFont("Arial Bold", 16, true);
  
  doctor = loadShape("doctor.svg");
  language = loadShape("language.svg");
  politician = loadShape("politician.svg");
  lawyer = loadShape("lawyer.svg");
  biz = loadShape("biz.svg");
  
  noLoop();
}

void draw() {
  
  //stroke(0);
  fill(135, 206, 250);
  rect(50, 100, 600, 90, 7);
  fill(0,0,205);
  textFont(bold_f,36);
  text("Field of study / work by hotness",60,120,590,90);
  
  fill(135, 206, 250);
  rect(800, 100, 90, 90);
  fill(0,0,205);
  textFont(bold_f,36);
  text("Men",810,120,90,90);
  
  fill(135, 206, 250);
  rect(890, 100, 140, 90);
  fill(0,0,205);
  textFont(bold_f,36);
  text("Women",900,120,130,90);
  
  fill(135, 150, 250);
  rect(1030, 100, 110, 90);
  fill(0,0,205);
  textFont(bold_f,36);
  text("Both",1040,120,90,90);
  
  shape(doctor, 0, 400, 150, 150);
  fill(0, 0, 0);
  textFont(bold_f,20);
  text("1st Medical students", 150, 400);
  text("33% ", 150, 430, 50, 50);
  text(s, 150, 470, 200, 200);
  
  shape(language, 400, 400, 150, 150);
  text("2nd Language students", 550, 400);
  text("30% ", 550, 430, 50, 50);
  text(s, 550, 470, 200, 200);
  
  shape(politician, 800, 370, 200, 200);
  text("3rd Politic students", 1000, 400);
  text("20% ", 1000, 430, 50, 50);
  text(s, 1000, 470, 200, 200);
  
  shape(lawyer, 0, 700, 150, 150);
  text("4th Law students", 150, 700);
  text("19% ", 150, 730, 50, 50);
  text(s, 150, 770, 200, 200);
  
  shape(biz, 400, 700, 150, 150);
  text("5th Economic students", 550, 700);
  text("18% ", 550, 730, 50, 50);
  text(s, 550, 770, 200, 200);
  
}

class Gauge {
  int x_upleft, y_upleft;
  float percent = 0;
  String title;
  String description;
  PShape shape;
  float text_distance = 35;
  int width;
  int height;
  

Gauge(int x, int y, float perc, String t, String desc, String s, int w, int h){
  x_upleft = x;
  y_upleft = y;
  percent = perc;
  title = t;
  description = desc;
  loadShape("cross.svg");  
  width = w;
  height = h;
}  

void drawGauge(){
  shape(shape,x_upleft,y_upleft,width,height);
}
}