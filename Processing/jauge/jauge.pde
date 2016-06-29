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

float radius = 100;
float x_center = radius + 50;
float y_center = 220;
float prop = 0.1;
float gauge_width = 5;
float gauge_depth = 5;
float percent_size = 15;
float title_size = 30;
float legend_size = 16;
float count_size = 20;
float margin = 1.8*radius;

float x_right = x_center + 6*radius + 10;
float y_sinc = y_center + margin;
float y_intel = y_sinc + margin;
float y_fun = y_intel + margin;
float y_amb = y_fun + margin;

Gauge attr_fem_gauge = new Gauge(radius, x_center, y_center, attr2_3_fem, attr1_s_mal, "Attractive women", "Women thinking attractiveness matters \nto men", "Men seeking attractive women",false);
Gauge attr_mal_gauge = new Gauge(radius, x_right, y_center, attr1_s_fem, attr2_3_mal, "Attractive men", "Women seeking attractive men","Men thinking attractiveness matters to women",true);

Gauge sinc_fem_gauge = new Gauge(radius, x_center, y_sinc, sinc2_3_fem, sinc1_s_mal, "Sincere women", "Women thinking sincerity matters to men", "Men seeking sincere women",false);
Gauge sinc_mal_gauge = new Gauge(radius, x_right, y_sinc, sinc1_s_fem, sinc2_3_mal, "Sincere men", "Women seeking sincere men","Men thinking sincerity matters to women",true);

Gauge intel_fem_gauge = new Gauge(radius, x_center, y_intel, intel2_3_fem, intel1_s_mal, "Intelligent women", "Women thinking intelligence matters \nto men", "Men seeking intelligent women",false);
Gauge intel_mal_gauge = new Gauge(radius, x_right, y_intel, intel1_s_fem, intel2_3_mal, "Intelligent men", "Women seeking intelligent men","Men thinking intelligence matters to women",true);

Gauge fun_fem_gauge = new Gauge(radius, x_center, y_fun, fun2_3_fem, fun1_s_mal, "Funny women", "Women thinking humour matters to men", "Men seeking funny women",false);
Gauge fun_mal_gauge = new Gauge(radius, x_right, y_fun, fun1_s_fem, fun2_3_mal, "Funny men", "Women seeking funny men","Men thinking humour matters to women",true);

Gauge amb_fem_gauge = new Gauge(radius, x_center, y_amb, amb2_3_fem, amb1_s_mal, "Ambitious women", "Women thinking ambition matters to men", "Men seeking ambitious women",false);
Gauge amb_mal_gauge = new Gauge(radius, x_right, y_amb, amb1_s_fem, amb2_3_mal, "Ambitious men", "Women seeking ambitious men","Men thinking ambition matters to women",true);

PFont f;
PFont bold_f;
ArrayList<TextBox> textBoxes = new ArrayList<TextBox>();
int indexCurrentlySelected = -1;
boolean expecSelected = false;
boolean stereoSelected = false;
boolean allSelected = false;

void setup() {
  size(1280,1024);
  surface.setResizable(true);
  f = createFont("Arial", 16, true);
  bold_f = createFont("Arial Bold", 16, true);
  int box_height = 50;
  int box_width = 200;
  int x_textBox = (int)(x_center + x_right)/2 - (int)1.5*box_width;
  int y_textBox = 20;
  ArrayList<String> textbox_labels = new ArrayList<String>();
  textbox_labels.add("Stereotypes");
  textbox_labels.add("Actual expectations");
  textbox_labels.add("Show all");
  textbox_labels.add("Reset");
  
  int n_boxes = textbox_labels.size();
  for (int i = 0; i < n_boxes; i++)
  {
    textBoxes.add(new TextBox(textbox_labels.get(i), x_textBox + i*box_width, y_textBox, box_width, box_height));
  }
}

  
  void updateTextBoxes() {
    ///Checks if any text boxes are currently being hovered over
    for (int i = 0; i < textBoxes.size(); i++)
    {
      TextBox tb = textBoxes.get(i);
      int x = tb.getX();
      int y = tb.getY();
      int h = tb.getH();
      int w = tb.getW();
      if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
        textBoxes.get(i).setHovered(true);
      }
      else
        textBoxes.get(i).setHovered(false);
    }
  }
  
void draw() {
  stereoSelected = (indexCurrentlySelected == 0);
  expecSelected = (indexCurrentlySelected == 1);
  allSelected = (indexCurrentlySelected == 2);
  background(255);
  noFill();
  updateTextBoxes();
  for (int i = 0; i < textBoxes.size(); i++){
    textBoxes.get(i).drawTextBox();
  }
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

void resetCounts(){
  attr_fem_gauge.resetCount();
  attr_mal_gauge.resetCount();
  sinc_fem_gauge.resetCount();
  sinc_mal_gauge.resetCount();
  intel_fem_gauge.resetCount();
  intel_mal_gauge.resetCount();
  fun_fem_gauge.resetCount();
  fun_mal_gauge.resetCount();
  amb_fem_gauge.resetCount();
  amb_mal_gauge.resetCount();  
}

class Gauge {
  float deg_1 = 0;
  float deg_2 = 0;
  float radius, x_center, y_center, red_1, green_1, blue_1, percent_limit_1, red_2, green_2, blue_2, percent_limit_2, proportion;
  float percent_1;
  float percent_2;
  String title;
  String description_1;
  String description_2;
  float gauge_border = 10;
  float text_distance = 35;
  boolean leftExpec;

  Gauge(float r, float x, float y, float l1, float l2, String tl, String des_1, String des_2, boolean expec) {
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
    leftExpec = expec;
  }

  void resetCount(){
    percent_1 = 0;
    percent_2 = 0;
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

  void needle(float width, boolean one, float R, float G, float B) {
    float deg = 0;
    if (one){
      if(percent_1 < 100) {
          percent_1 ++;
          deg_1 = percent_1 / 100 * percent_limit_1 * 1.8;
        }
      deg = deg_1;
    }
    else{
      if(percent_2 < 100) {
          percent_2 ++;
          deg_2 = percent_2 / 100 * percent_limit_2 * 1.8;
        }
      deg = deg_2;
    }
      
    float x_1 = x_center + width*cos(PI/2 + radians(deg)) + gauge_depth*cos(radians(deg));
    float y_1 = y_center + width*sin(PI/2 + radians(deg)) + gauge_depth*sin(radians(deg));
    float x_2 = x_center + width*cos(3*PI/2 + radians(deg)) + gauge_depth*cos(radians(deg));
    float y_2 = y_center + width*sin(3*PI/2 + radians(deg)) + gauge_depth*sin(radians(deg));
    float x_peak = x_center + radius*cos(PI + radians(deg));
    float y_peak = y_center + radius*sin(PI + radians(deg));
    float x_far = x_center + (radius + gauge_border)*(1+1.3*proportion)*cos(PI + radians(deg));
    float y_far = y_center + (radius + gauge_border)*(1+1.3*proportion)*sin(PI + radians(deg));
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
    float y_2 = y_center - radius/4;
    if(stereoSelected){
      if(leftExpec)
        box(x_2, y_2, red_2, green_2, blue_2, description_2);
      else
        box(x_1, y_1, red_1, green_1, blue_1, description_1);
    } else if (expecSelected){
      if(!leftExpec)
        box(x_2, y_2, red_2, green_2, blue_2, description_2);
      else
        box(x_1, y_1, red_1, green_1, blue_1, description_1);
    }else if(allSelected){
      box(x_1, y_1, red_1, green_1, blue_1, description_1);
      box(x_2, y_2, red_2, green_2, blue_2, description_2);
    }
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
    
    if(allSelected){
      needle(gauge_width, true, red_1, green_1, blue_1);
      needle(gauge_width, false, red_2, green_2, blue_2); 
    } else if(expecSelected){
      if(leftExpec)
        needle(gauge_width, true, red_1, green_1, blue_1);
      else
        needle(gauge_width, false, red_2, green_2, blue_2);
    } else if(stereoSelected){
      if(!leftExpec)
        needle(gauge_width, true, red_1, green_1, blue_1);
      else
        needle(gauge_width, false, red_2, green_2, blue_2);
    } 
    fill(255);
    ellipse(x_center, y_center, gauge_width, gauge_width);
    noFill();

    title();
  }
}


void mousePressed() {
  checkSelectedTextBox();
  resetCounts();
}


void checkSelectedTextBox() {
  ///Checks if there are any text boxes being selected; if so, makes the necessary changes
  boolean changeState = false;
  int index_change = -1;
  
  //Sees if any boxes are currently being hovered over and gets the corresponding index
  for (int i = 0; i < textBoxes.size(); i++)
  {
    if (textBoxes.get(i).isHovered())
    {
      changeState = true;
      index_change = i;
      break;
    }
  }
  
  //Uses the index from the previous step to make the necessary changes
  if (index_change != -1)
  {
    textBoxes.get(index_change).setSelected(true);
    if (indexCurrentlySelected != -1)
      textBoxes.get(indexCurrentlySelected).setSelected(false);
    indexCurrentlySelected = index_change;
  }
}