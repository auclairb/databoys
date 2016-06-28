float attr1_s_fem = 56.17597;
float attr1_s_mal = 48.37709;
float sinc1_s_fem = 49.59391;
float sinc1_s_mal = 47.94749;
float intel1_s_fem = 36.02369;
float intel1_s_mal = 45.27446;
float fun1_s_fem = 31.98816;
float fun1_s_mal = 42.17184;
float amb1_s_fem = 52.85956;
float amb1_s_mal = 58.06683;

float attr2_3_fem = 72.24;
float attr2_3_mal = 65.21158;
float sinc2_3_fem = 79.06;
float sinc2_3_mal = 71.26949;
float intel2_3_fem = 84.8;
float intel2_3_mal = 75.45657;
float fun2_3_fem = 73.92;
float fun2_3_mal = 72.91759;
float amb2_3_fem = 70.96;
float amb2_3_mal = 79.15367;

float speed = 80;
float radius = 200;
float x_center = 300;
float y_center = 300;
float prop = 0.1;
float gauge_width = 10;
float gauge_depth = 10;
float alpha = 0.1;
Gauge attr_fem_gauge = new Gauge(radius, x_center, y_center, attr1_s_fem, attr2_3_mal, "Attractiveness for men", "Women expecting men attractiveness","Men thinking women expect attractiveness");
Gauge attr_mal_gauge = new Gauge(radius, x_center, y_center + 2*radius, attr1_s_mal, attr2_3_fem, "Attractiveness for women", "Women thinking men expect attractiveness", "Men expecting women attractiveness");
//Gauge gauge1 = new Gauge(radius,x_center,y_center+400,30,70, "Sincere");
//Gauge gauge2 = new Gauge(radius,x_center,y_center+800,30,70, "Intelligent");
//Gauge gauge3 = new Gauge(radius,x_center,y_center+1200,30,70, "Funny");
//Gauge gauge4 = new Gauge(radius,x_center,y_center+1200,30,70, "Ambition");
PFont f;
PFont bold_f;

void setup() {
  size(1200, 800);
  surface.setResizable(true);
  f = createFont("Arial", 16, true);
  bold_f = createFont("Arial Bold", 16, true);
  //noLoop(); 
  //readData();
}

void draw() {
  background(255);
  noFill();
  attr_fem_gauge.update();
  attr_mal_gauge.update();
}
class Gauge {
  float deg_1 = 0;
  float deg_2 = 0;
  float radius, x_center, y_center, red_1, green_1, blue_1, percent_limit_1, red_2, green_2, blue_2, percent_limit_2, proportion;
  float percent_1 = 0;
  float percent_2 = 0;
  String title;
  String description_1;
  String description_2;
  float gauge_border = 10;
  float text_distance = 35;

  Gauge(float r, float x, float y, float l1, float l2, String tl, String des_1, String des_2) {
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
    title = tl;
    description_1 = des_1;
    description_2 = des_2;
  }

  void percentDash(float percent) {
    float x_peak = x_center + radius*cos(PI + radians(1.8*percent));
    float y_peak = y_center + radius*sin(PI + radians(1.8*percent));
    float x_middle = x_center + radius*(1-proportion)*cos(PI + radians(1.8*percent));
    float y_middle = y_center + radius*(1-proportion)*sin(PI + radians(1.8*percent));
    float x_far = x_center + radius*(1-2*proportion)*cos(PI + radians(1.8*percent));
    float y_far = y_center + radius*(1-2*proportion)*sin(PI + radians(1.8*percent));
    strokeWeight(3);
    line(x_peak, y_peak, x_middle, y_middle);
    strokeWeight(1);
    textFont(f, 16);
    fill(0);
    textAlign(CENTER);
    text((int)percent, x_far, y_far);
  }

  void fivePercentDash(float percent) {
    float x_peak = x_center + radius*cos(PI + radians(1.8*percent));
    float y_peak = y_center + radius*sin(PI + radians(1.8*percent));
    float x_middle = x_center + radius*(1-0.7*proportion)*cos(PI + radians(1.8*percent));
    float y_middle = y_center + radius*(1-0.7*proportion)*sin(PI + radians(1.8*percent));
    strokeWeight(2);
    line(x_peak, y_peak, x_middle, y_middle);
    strokeWeight(1);
  }

  void onePercentDash(float percent) {
    float x_peak = x_center + radius*cos(PI + radians(1.8*percent));
    float y_peak = y_center + radius*sin(PI + radians(1.8*percent));
    float x_middle = x_center + radius*(1-0.3*proportion)*cos(PI + radians(1.8*percent));
    float y_middle = y_center + radius*(1-0.3*proportion)*sin(PI + radians(1.8*percent));
    line(x_peak, y_peak, x_middle, y_middle);
  }

  void percents() {
    for (int i=1; i<100; i++) {
      if (i%10 == 0)
        percentDash(i);
      else if (i%5 == 0)
        fivePercentDash(i);
      else
        onePercentDash(i);
      System.out.println(i%10);
    }
  }

  void needle(float width, float deg, float R, float G, float B) {
    float x_1 = x_center + width*cos(PI/2 + radians(deg)) + gauge_depth*cos(radians(deg));
    float y_1 = y_center + width*sin(PI/2 + radians(deg)) + gauge_depth*sin(radians(deg));
    float x_2 = x_center + width*cos(3*PI/2 + radians(deg)) + gauge_depth*cos(radians(deg));
    float y_2 = y_center + width*sin(3*PI/2 + radians(deg)) + gauge_depth*sin(radians(deg));
    float x_peak = x_center + radius*cos(PI + radians(deg));
    float y_peak = y_center + radius*sin(PI + radians(deg));
    float x_far = x_center + (radius + gauge_border)*(1+proportion)*cos(PI + radians(deg));
    float y_far = y_center + (radius + gauge_border)*(1+proportion)*sin(PI + radians(deg));
    fill(R, G, B);
    triangle(x_1, y_1, x_2, y_2, x_peak, y_peak);
    fill(R, G, B, 100);
    noStroke();
    arc(x_center, y_center, 2*radius, 2*radius, PI, PI+radians(deg), PIE);
    stroke(0);
    noFill();
    textFont(bold_f, 16);
    fill(R, G, B);
    textAlign(CENTER);
    text((int)(deg/1.8) + "%", x_far, y_far);
    noFill();
  }

  void box(float x, float y, float R, float G, float B, String des){
    fill(R,G,B);
    rect(x,y,35,20);
    noFill();
  }
  
  void boxes(){
    float x_1 = x_center + radius + gauge_border + 10;
    float y_1 = y_center - radius*2/3;
    float x_2 = x_center + radius + gauge_border + 10;
    float y_2 = y_center - radius/3;
    box(x_1, y_1, red_1, green_1, blue_1, description_1);
    textAlign(LEFT);
    text(description_1, x_1 + 45, y_1 + 15);
    box(x_2, y_2, red_2, green_2, blue_2, description_2);
    text(description_2, x_2 + 45, y_2 + 15);
  }
  
  void update() {
    boxes();
    fill(150);
    arc(x_center, y_center, 2*(radius + gauge_border), 2*(radius+gauge_border), PI, 2*PI, PIE);
    noStroke();
    rect(x_center - (radius + gauge_border), y_center, 2*(radius+gauge_border), gauge_border);
    stroke(0);
    line(x_center - (radius + gauge_border), y_center, x_center - (radius + gauge_border), y_center + gauge_border);
    line(x_center - (radius + gauge_border), y_center + gauge_border, x_center + (radius + gauge_border), y_center + gauge_border);
    line(x_center + (radius + gauge_border), y_center, x_center + (radius + gauge_border), y_center + gauge_border);
    fill(200);
    arc(x_center, y_center, 2*radius, 2*radius, PI, 2*PI, PIE);
    noFill();
    percents();
    if (deg_1 + percent_limit_1/speed <= percent_limit_1*1.8) {
      deg_1 += percent_limit_1/speed;
    }
    needle(gauge_width, deg_1, red_1, green_1, blue_1);
    if (deg_2 + percent_limit_2/speed <= percent_limit_2*1.8) {
      deg_2 += percent_limit_2/speed;
    }
    needle(gauge_width, deg_2, red_2, green_2, blue_2);
    fill(255);
    ellipse(x_center, y_center, gauge_width, gauge_width);
    noFill();
    textAlign(CENTER);
    fill(0);
    textFont(bold_f,20);
    text(title, x_center, y_center - (radius + gauge_border)*(1 + 2*proportion));
  }
}



void mousePressed() {
  if (mousePressed==true) {
    float mousX=mouseX;
    float mousY=mouseY;
    println("mouseX = " + mousX + " mouseY =" + mousY);
  }
}