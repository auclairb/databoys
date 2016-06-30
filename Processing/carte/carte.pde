import javax.swing.ImageIcon;
import javax.swing.JLabel;

university universityBoth[];
university universityMen[];
university universityWomen[];
int lengthBoth,lengthMen,lengthWomen;
float maxMatch=0;
float minMatch=2;
Button men = new Button("Men",20,90,200,40);
Button women = new Button("Women",20,50,200,40);
Button both = new Button("Both",20,10,200,40);
ArrayList<Button> textBoxes = new ArrayList<Button>();
int indexCurrentlySelected = 0;
PImage carte;

PFont f;
PFont bold_f;

void setup(){
  size(1280,1024);
  carte = loadImage("carte_monde.jpg");
  
  textBoxes.add(both);
  textBoxes.add(women);
  textBoxes.add(men);
  both.setSelected(true);
  
  f = createFont("Arial", 16, true);
  bold_f = createFont("Arial Bold", 16, true);
  
  draw();
  
}

void readData(){
  
  String[] lines = loadStrings("univ_ranking.csv");
  println("Loaded " + lines.length + " lines.");
  lengthBoth = lines.length;
  
  universityBoth = new university[lines.length];
  for(int i = 1;i<lines.length;i++){
   String[] columns = lines[i].split(";");
   universityBoth[i-1] = new university(columns[1],float(columns[2]),float(columns[3]),float(columns[4]));
  }
  
  lines = loadStrings("univ_ranking_for_men.csv");
  println("Loaded " + lines.length + " lines.");
  lengthMen = lines.length;
  
  universityMen = new university[lines.length];
  for(int i = 1;i<lines.length;i++){
   String[] columns = lines[i].split(";");
   universityMen[i-1] = new university(columns[1],float(columns[2]),float(columns[3]),float(columns[4]));
  }
  
  lines = loadStrings("univ_ranking_for_women.csv");
  println("Loaded " + lines.length + " lines.");
  lengthWomen = lines.length;
  
  universityWomen = new university[lines.length];
  for(int i = 1;i<lines.length;i++){
   String[] columns = lines[i].split(";");
   universityWomen[i-1] = new university(columns[1],float(columns[2]),float(columns[3]),float(columns[4]));
  }
}

void draw(){
  image(carte,0,0,1280,1024);
  readData();
  
  updateButton(mouseX,mouseY);
  updateUniversity(mouseX,mouseY);
  
  if(indexCurrentlySelected==0){
    maxMatch=0;
    minMatch=2;
    for(int i = lengthBoth-19 ; i <= lengthBoth-2 ; i++){
      maxMatch = max(maxMatch,universityBoth[i].getMatch());
      minMatch = min(minMatch,universityBoth[i].getMatch());
      universityBoth[i].draw(); 
      strokeWeight(1);
      textFont(bold_f, 30);
      fill(0);
      text("Top 20 rate match in universities for men and women",280,900);
    }
  } else if (indexCurrentlySelected==1){
    maxMatch=0;
    minMatch=2;
      for(int i = lengthWomen-19 ; i <= lengthWomen-2 ; i++){
        maxMatch = max(maxMatch,universityWomen[i].getMatch());
        minMatch = min(minMatch,universityWomen[i].getMatch());
        universityWomen[i].draw(); 
        strokeWeight(1);
        textFont(bold_f, 30);
        fill(0);
        text("Top 20 rate match in universities for women",280,900);
       }
  } else if (indexCurrentlySelected==2){
    maxMatch=0;
    minMatch=2;
      for(int i = lengthMen-19 ; i <= lengthMen-2 ; i++){
        maxMatch = max(maxMatch,universityMen[i].getMatch());
        minMatch = min(minMatch,universityMen[i].getMatch());
        universityMen[i].draw(); 
        strokeWeight(1);
        textFont(bold_f, 30);
        fill(0);
        text("Top 20 rate match in universities for men",300,900);
      }
  }
  
  for(int i = 0; i< textBoxes.size();i++){
    textBoxes.get(i).drawButton();
  }
  
  university lowRate = new university("lowRate",minMatch,-150,-35);
  lowRate.draw();
  strokeWeight(1);
  textFont(f, 15);
  fill(0);
  text("lowest rate match",lowRate.x()+15,lowRate.y()+6);
  
  university highRate = new university("highRate",maxMatch,-150,-30);
  highRate.draw();
  strokeWeight(1);
  textFont(f, 15);
  fill(0);
  text("highest rate match",highRate.x()+15,highRate.y()+6);
}

void mousePressed(){
  checkSelectedTextBox();
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

void updateUniversity(int mousex,int mousey){
  
  if(indexCurrentlySelected==0){
    for(int i = lengthBoth-19 ; i <= lengthBoth-2 ; i++){
      int x = universityBoth[i].x();
      int y = universityBoth[i].y();
      
      if(mousex>x-20 && mousex<x+20 && mousey>y-20 && mousey<y+20){
        universityBoth[i].setHovered(true);
      }
      else
        universityBoth[i].setHovered(false);
    }
  } else if (indexCurrentlySelected==1){
    for(int i = lengthWomen-19 ; i <= lengthWomen-2 ; i++){
      int x = universityWomen[i].x();
      int y = universityWomen[i].y();
      
      if(mousex>x-20 && mousex<x+20 && mousey>y-20 && mousey<y+20){
        universityWomen[i].setHovered(true);
      }
      else
        universityWomen[i].setHovered(false);
    }
    
  }else if (indexCurrentlySelected==2){
    for(int i = lengthMen-19 ; i <= lengthMen-2 ; i++){
      int x = universityMen[i].x();
      int y = universityMen[i].y();
      
      if(mousex>x-20 && mousex<x+20 && mousey>y-20 && mousey<y+20){
        universityMen[i].setHovered(true);
      }
      else
        universityMen[i].setHovered(false);
    }
    
  }
  
}


void updateButton(int mousex, int mousey) {
  ///Checks if any text boxes are currently being hovered over
  for (int i = 0; i < textBoxes.size(); i++)
  {
    Button tb = textBoxes.get(i);
    int x = tb.getX();
    int y = tb.getY();
    int h = tb.getH();
    int w = tb.getW();
    if (mousex >= x && mousex <= x+w && mousey >= y && mousey <= y+h) {
      textBoxes.get(i).setHovered(true);
    }
    else
      textBoxes.get(i).setHovered(false);
  }
}