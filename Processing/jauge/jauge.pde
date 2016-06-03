void setup(){
  size(800,800);
  noLoop(); 
  readData();
}

void draw(){
  background(255);
  for (Place place : places){
    place.draw();
  }
}

void mousePressed(){
    if (mousePressed==true){
    float mousX=mouseX;
    float mousY=mouseY;
    println("mouseX = " + mousX + " mouseY =" + mousY);
    for (Place place : places){
      if( abs(mousX-place.x())<2 && abs(mousY-place.y())<2){
        println(place.name);
        JOptionPane.showMessageDialog(frame, "Name :" + place.name + " " + "Code postale :" + place.postalCode);
      }
    }
  }
}
