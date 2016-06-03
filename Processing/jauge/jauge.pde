float degree = 0;

void setup() {
  size(800, 800);
  //noLoop(); 
  //readData();
}

void draw() {
  background(255);
  noFill();
  arc(80, 60, 100, 100, PI, 2*PI);
  line(30,60,130,60);
  needle(50,degree,80,60);
  if(degree <180){

    degree ++;
  }
}

void needle(int radius, float deg, float x_center, float y_center) {
  float x_peak = x_center - radius;
  float y_peak = y_center;
  x_peak = x_center + radius*cos(PI + radians(deg));
  y_peak = y_center + radius*sin(PI + radians(deg));
  line(x_peak, y_peak, x_center, y_center);
}

void mousePressed() {
  if (mousePressed==true) {
    float mousX=mouseX;
    float mousY=mouseY;
    println("mouseX = " + mousX + " mouseY =" + mousY);
    /*
    for (Place place : places){
     if( abs(mousX-place.x())<2 && abs(mousY-place.y())<2){
     println(place.name);
     JOptionPane.showMessageDialog(frame, "Name :" + place.name + " " + "Code postale :" + place.postalCode);
     }
     }*/
  }
}

