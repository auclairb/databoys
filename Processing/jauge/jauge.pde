void setup() {
  size(800, 800);
  noLoop(); 
  //readData();
}

void draw() {

  background(255);
  noFill();
  arc(80, 60, 100, 100, PI, 2*PI);
  needle(50,80,60);
}

void needle(int radius, float x_center, float y_center) {
  float x_peak = x_center - radius;
  float y_peak = y_center;
  for (int i=0; i<360; i++) {
    line(x_peak, y_peak, x_center, y_center);
    x_peak = x_center + radius*cos(PI + radians(i));
    y_peak = y_center + radius*sin(PI + radians(i));
    try{
      Thread.sleep(500);
    }catch(InterruptedException e){
      System.out.println("Got Interrupted !");
    }
  }
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

