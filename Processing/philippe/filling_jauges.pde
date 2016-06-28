PShape doctor;
PShape language;
PShape politician;
PShape lawyer;
PShape biz;

PFont f;
PFont bold_f;

String s = "of positive answers after the first date";

//Gauge cross = new Gauge(100,100,23.,"bla","bla","cross.svg",100,100);

void setup() {
  size(1200, 700);
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
  rect(50, 20, 600, 90, 7);
  fill(0,0,205);
  textFont(bold_f,36);
  text("Field of study/Work by hotness",60,40,590,90);
  
  shape(doctor, 0, 200, 150, 150);
  fill(0, 0, 0);
  textFont(bold_f,20);
  text("1st Medical students", 150, 200);
  text("33% ", 150, 230, 50, 50);
  text(s, 150, 270, 200, 200);
  
  shape(language, 400, 200, 150, 150);
  text("2nd Language students", 550, 200);
  text("33% ", 550, 230, 50, 50);
  text(s, 550, 270, 200, 200);
  
  shape(politician, 750, 200, 150, 150);
  text("3rd Medical students", 950, 200);
  text("33% ", 950, 230, 50, 50);
  text(s, 950, 270, 200, 200);
  
  shape(lawyer, 0, 500, 150, 150);
  text("4th Law students", 150, 500);
  text("33% ", 150, 530, 50, 50);
  text(s, 150, 570, 200, 200);
  
  shape(biz, 400, 500, 150, 150);
  text("5th Economic students", 550, 500);
  text("33% ", 550, 530, 50, 50);
  text(s, 550, 570, 200, 200);
  
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