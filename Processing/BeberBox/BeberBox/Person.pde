class Person {
  private String gender;
  private String age;
  private String race;
  private String profession;
  private ArrayList<String> interests;
  
  private int x;
  private int y;
  private int w;
  private int h;
  
  public Person(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    interests = new ArrayList<String>();
  }
  
  public void setGender(String gender) {
    this.gender = gender;
  }
  public void setAge(String age) {
    this.age = age;
  }
  public void setRace(String race) {
    this.race = race;
  }
  public void setProfession(String profession) {
    this.profession = profession;
  }
  public void addInterest(String interest) {
    this.interests.add(interest);
  }
  
  public void drawPerson() {
  
  }
  
  public void drawBasicForm() {
    //Consider race somewhere in here
    line(x + w/2, y + 3*h/4, x + w/4, y + h); //legs
    line(x + w/2, y + 3*h/4, x + 3*w/4, y + h); //legs
    line(x + w/2, y + 1.5*h/4, x + w/4, y + h/2); //arms
    line(x + w/2, y + 1.5*h/4, x + 3*w/4, y + h/2); //arms
    
    if (gender == "F") {
      fill(255,20,147);
      triangle(x + w/2, y + 1.5*h/4, x + w/4, y + 3.5*h/4, x + 3*w/4, y + 3.5*h/4);
      line(x + w/2, y + h/4, x + w/2, y + 1.5*h/4);
    }
    else  
      line(x + w/2, y + h/4, x + w/2, y + 3*h/4); //body
    
    if (race == "Black")
      fill(165,42,42);
    else if (race == "Asian")
      fill(255, 204, 0);
    else
      fill(255);
    ellipse(x + w/2, y + h/8, h/4, h/4);
    
    noFill();
    arc(x + w/2, y + h/8, h/8, h/8, QUARTER_PI, 3*QUARTER_PI);
    if (race == "Asian") {
      line(x + w/3, y + h/16, x + w/2.25, y + 1.5*h/16);
      line(x + 2*w/3, y + h/16, x + 5*w/9, y + 1.5*h/16);
    }
    else {
      fill(255);
      ellipse(x + 8*w/18, y + 2.5*h/32, h/32, h/16);
      //arc
      ellipse(x + 10*w/18, y + 2.5*h/32, h/32, h/16);
      //arc
    }
  }
  
  public void drawAge() {
  }
  public void drawGender() {
  }
  public void drawInterests() {

  }
  public void drawProfession() {
  }
  
}
