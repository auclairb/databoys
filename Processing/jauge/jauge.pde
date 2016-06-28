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

float speed = 180;
float radius = 130;
float x_center = 350;
float y_center = 180;
float prop = 0.1;
float gauge_width = 5;
float gauge_depth = 5;
float percent_size = 15;
float title_size = 30;
float legend_size = 16;
float count_size = 20;
float margin = 1.65*radius;

float x_right = x_center + 6*radius;
float y_sinc = y_center + margin;
float y_intel = y_sinc + margin;
float y_fun = y_intel + margin;
float y_amb = y_fun + margin;

Gauge attr_fem_gauge = new Gauge(radius, x_center, y_center, attr2_3_fem, attr1_s_mal, "Attractive women", "Women thinking attractiveness matters to men", "Men seeking attractive women");
Gauge attr_mal_gauge = new Gauge(radius, x_right, y_center, attr1_s_fem, attr2_3_mal, "Attractive men", "Women seeking attractive men","Men thinking attractiveness matters to women");

Gauge sinc_fem_gauge = new Gauge(radius, x_center, y_sinc, sinc2_3_fem, sinc1_s_mal, "Sincere women", "Women thinking sincerity matters to men", "Men seeking sincere women");
Gauge sinc_mal_gauge = new Gauge(radius, x_right, y_sinc, sinc1_s_fem, sinc2_3_mal, "Sincere men", "Women seeking sincere men","Men thinking sincerity matters to women");

Gauge intel_fem_gauge = new Gauge(radius, x_center, y_intel, intel2_3_fem, intel1_s_mal, "Intelligent women", "Women thinking intelligence matters to men", "Men seeking intelligent women");
Gauge intel_mal_gauge = new Gauge(radius, x_right, y_intel, intel1_s_fem, intel2_3_mal, "Intelligent men", "Women seeking intelligent men","Men thinking intelligence matters to women");

Gauge fun_fem_gauge = new Gauge(radius, x_center, y_fun, fun2_3_fem, fun1_s_mal, "Funny women", "Women thinking humour matters to men", "Men seeking funny women");
Gauge fun_mal_gauge = new Gauge(radius, x_right, y_fun, fun1_s_fem, fun2_3_mal, "Funny men", "Women seeking funny men","Men thinking humour matters to women");

Gauge amb_fem_gauge = new Gauge(radius, x_center, y_amb, amb2_3_fem, amb1_s_mal, "Ambitious women", "Women thinking ambition matters to men", "Men seeking ambitious women");
Gauge amb_mal_gauge = new Gauge(radius, x_right, y_amb, amb1_s_fem, amb2_3_mal, "Ambitious men", "Women seeking ambitious men","Men thinking ambition matters to women");

PFont f;
PFont bold_f;

void setup() {
  fullScreen();
  surface.setResizable(true);
  f = createFont("Arial", 16, true);
  bold_f = createFont("Arial Bold", 16, true);
}

void draw() {
  background(255);
  noFill();
  attr_fem_gauge.update();
  attr_mal_gauge.update();
  sinc_fem_gauge.update();
  sinc_mal_gauge.update();
  intel_fem_gauge.update();
  intel_mal_gauge.update();
  fun_fem_gauge.update();
  fun_mal_gauge.update();
  amb_fem_gauge.update();
  amb_mal_gauge.update();
}
class Gauge {
  float deg_1 = 0;
  float deg_2 = 0;
  float radius, x_center, y_center, red_1, green_1, blue_1, percent_limit_1, red_2, green_2, blue_2, percent_limit_2, proportion;
  float percent = 0;
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
    float x_far = x_center + radius*(1-2.5*proportion)*cos(PI + radians(1.8*percent));
    float y_far = y_center + radius*(1-2.5*proportion)*sin(PI + radians(1.8*percent));
    strokeWeight(2);
    line(x_peak, y_peak, x_middle, y_middle);
    strokeWeight(1);
    textFont(f, percent_size);
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
    fill(R, G, B, 130);
    noStroke();
    arc(x_center, y_center, 2*radius, 2*radius, PI, PI+radians(deg), PIE);
    stroke(0);
    noFill();
    textFont(bold_f, count_size);
    fill(R, G, B);
    textAlign(CENTER);
    text((int)(deg/1.8) + "%", x_far, y_far);
    noFill();
  }

  void box(float x, float y, float R, float G, float B, String des){
    fill(R,G,B);
    rect(x,y,35,20);
    noFill();
    textAlign(LEFT);
    textFont(f, legend_size);
    text(des, x + 45, y + 15);
  }
  
  void boxes(){
    float x_1 = x_center + radius + gauge_border + 30;
    float y_1 = y_center - radius*2/3;
    float x_2 = x_center + radius + gauge_border + 30;
    float y_2 = y_center - radius/3;
    box(x_1, y_1, red_1, green_1, blue_1, description_1);
    box(x_2, y_2, red_2, green_2, blue_2, description_2);
  }
  
  void title(){
    textAlign(LEFT);
    fill(0);
    textFont(bold_f,title_size);
    text(title, x_center + radius + gauge_border + 30, y_center - radius);
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
    arc(x_center, y_center, 0.9*radius, 0.9*radius, PI, 2*PI);
    percents(); 
    if (percent < 100) {
      percent ++;
      deg_1 = percent / 100 * percent_limit_1 * 1.8;
      deg_2 = percent / 100 *percent_limit_2 * 1.8;
    }
    needle(gauge_width, deg_1, red_1, green_1, blue_1);
    needle(gauge_width, deg_2, red_2, green_2, blue_2); 
    
    fill(255);
    ellipse(x_center, y_center, gauge_width, gauge_width);
    noFill();

    title();
  }
}



void mousePressed() {
  if (mousePressed==true) {
    float mousX=mouseX;
    float mousY=mouseY;
    println("mouseX = " + mousX + " mouseY =" + mousY);
  }
}