float radius = 200;
float x_center = 300;
float y_center = 300;
float prop = 0.1;
float gauge_width = 10;
float gauge_depth = 10;
float alpha = 0.1;
Gauge gauge = new Gauge(radius,x_center,y_center,40,90);
Gauge gauge1 = new Gauge(radius,x_center,y_center+400,30,70);
PFont f;

void setup() {
  size(800, 800);
  f = createFont("Arial",16,true);
  //noLoop(); 
  //readData();
}

void draw() {
  background(255);
  noFill();
  gauge.update();
  gauge1.update();
}
class Gauge {
  float deg_1, deg_2, radius, x_center, y_center, red_1, green_1, blue_1, percent_limit_1, red_2, green_2, blue_2, percent_limit_2, proportion;

  Gauge(float r, float x, float y, float l1, float l2){
    deg_1 = 0;
    deg_2 = 0;
    radius = r;
    x_center = x;
    y_center = y;
    red_1 = 255;
    green_1 = 102;
    blue_1 = 255;
    percent_limit_1 = l1;
    red_2 = 102;
    green_2 = 178;
    blue_2 = 255;
    percent_limit_2 = l2;
    proportion = prop;
  }
  
  Gauge(float r, float x, float y, float R1, float G1, float B1, float l1, float R2, float G2, float B2, float l2, float p){
    deg_1 = 0;
    deg_2 = 0;
    radius = r;
    x_center = x;
    y_center = y;
    red_1 = R1;
    green_1 = G1;
    blue_1 = B1;
    percent_limit_1 = l1;
    red_2 = R2;
    green_2 = G2;
    blue_2 = B2;
    percent_limit_2 = l2;
    proportion = p;
  }
  
  
  void percentDash(float percent){
    float x_peak = x_center + radius*cos(PI + radians(1.8*percent));
    float y_peak = y_center + radius*sin(PI + radians(1.8*percent));
    float x_middle = x_center + radius*(1-proportion)*cos(PI + radians(1.8*percent));
    float y_middle = y_center + radius*(1-proportion)*sin(PI + radians(1.8*percent));
    float x_far = x_center + radius*(1-2*proportion)*cos(PI + radians(1.8*percent));
    float y_far = y_center + radius*(1-2*proportion)*sin(PI + radians(1.8*percent));
    line(x_peak, y_peak, x_middle, y_middle);
    textFont(f,16);
    fill(0);
    textAlign(CENTER);
    text((int)percent,x_far,y_far);
  }
  /*
  void needle(float deg) {
    float x_peak = x_center + radius*cos(PI + radians(deg));
    float y_peak = y_center + radius*sin(PI + radians(deg));
    line(x_peak, y_peak, x_center, y_center);
  }*/
  
  void needle(float width, float deg, float R, float G, float B){
    float x_1 = x_center + width*cos(PI/2 + radians(deg)) + gauge_depth*cos(radians(deg));
    float y_1 = y_center + width*sin(PI/2 + radians(deg)) + gauge_depth*sin(radians(deg));
    float x_2 = x_center + width*cos(3*PI/2 + radians(deg)) + gauge_depth*cos(radians(deg));
    float y_2 = y_center + width*sin(3*PI/2 + radians(deg)) + gauge_depth*sin(radians(deg));
    float x_peak = x_center + radius*cos(PI + radians(deg));
    float y_peak = y_center + radius*sin(PI + radians(deg));
    fill(R,G,B);
    triangle(x_1,y_1,x_2,y_2,x_peak,y_peak);
    fill(R,G,B,100);
    noStroke();
    arc(x_center,y_center,2*radius,2*radius,PI,PI+radians(deg),PIE);
    stroke(0);
    noFill();
  }
  
  void update(){
    fill(200);
    arc(x_center, y_center, 2*radius, 2*radius, PI, 2*PI,PIE);
    noFill();
    //line(x_center-radius,y_center,x_center+radius,y_center);
    percentDash(10);
    percentDash(20);
    percentDash(30);
    percentDash(40);
    percentDash(50);
    percentDash(60);
    percentDash(70);
    percentDash(80);
    percentDash(90);
    needle(gauge_width,deg_1,red_1,green_1,blue_1);
    if(deg_1 <percent_limit_1*1.8){
      deg_1 += percent_limit_1/100;
    }
    needle(gauge_width,deg_2,red_2,green_2,blue_2);
    if(deg_2 <percent_limit_2*1.8){
      deg_2 += percent_limit_2/100;
    }
    fill(255);
    ellipse(x_center,y_center,gauge_width,gauge_width);
    noFill();
  }
}



void mousePressed() {
  if (mousePressed==true) {
    float mousX=mouseX;
    float mousY=mouseY;
    println("mouseX = " + mousX + " mouseY =" + mousY);
  }
}