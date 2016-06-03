void setup(){
  size(800,800);
  noLoop(); 
  //readData();
}

void draw(){
  
  background(255);
  noFill();
    line(80,10,80,60);
  arc(80,60,100,100,PI,2*PI);
  line(30,60,130,60);
    pushMatrix();
rotate(radians(45));

  popMatrix();
}

void mousePressed(){
    if (mousePressed==true){
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
