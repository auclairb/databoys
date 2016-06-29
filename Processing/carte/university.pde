

class university{
  String name;
  float match,longitude,latitude;
  
  private boolean hovered = false;
  
  university(String _name, float _match, float x, float y){
    name=_name;
    match=_match;
    latitude = y;
    longitude = x;
  }
  int x(){
    return (int) map(longitude,-160,180,0,1280);
  }
 
  int y(){
    return (int) map(latitude,90,-45,0,1024);
  }
  
  color colored(){
    return color(ceil((match-minMatch)/(maxMatch-minMatch)*255),ceil((maxMatch-match)/(maxMatch-minMatch)*255),ceil((maxMatch-match)/(maxMatch-minMatch)*255));
  }
  
  public String getName(){
    return name;
  }
  
  public float getMatch(){
      return match;
  }
  
  public boolean isHovered() {
    return hovered;
  }
  
  public void setHovered(boolean state) {
    this.hovered = state;
  }
  
  void draw(){
    fill(colored());
    stroke(0,0,0);
    strokeWeight(2);
    ellipse(x(),y(),20,20);
    
   if(isHovered()){
     fill(color(255));
     strokeWeight(2);
     rect(20,750,330,100,2);
     fill(color(0));
     textFont(f, 15);
     text("University : " + name,30,780);
     text("With a rate match of : " + match,30,820);
   }
  }
}