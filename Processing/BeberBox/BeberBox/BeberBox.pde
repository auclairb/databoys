import java.util.ArrayList;

Table table;
ArrayList<TextBox> textBoxes = new ArrayList<TextBox>();
ArrayList<TextBox> labelResultBoxes = new ArrayList<TextBox>();
ArrayList<TextBox> resultBoxes = new ArrayList<TextBox>();

Menu emptyMenuInput;
Menu emptyMenuOutput;
TextBox emptyBox;
TextBox matchRateBox;

ArrayList<Menu> menus = new ArrayList<Menu>();
int indexCurrentlySelected = -1;

Person p;
Person m;
String gender;
String age;
String race;
String profession;
ArrayList<String> interests = new ArrayList<String>();

void setup() {
  size(800, 800);
  
  // Creates a new table from a csv file that uses ";" as separator and where the second line should be ignored.
  Table table = new Table("SpeedDating.csv", ",", new int[]{});

  // Reads two cell values from the table
  final int personGender = table.getColumnIndex("gender");
  final int int_corr = table.getColumnIndex("int_corr");
  print("The gender is " + table.get(personGender, 0));
  println(" and has int_corr equal to " + table.get(int_corr, 0));
  
  int usable_width = 700;
  int usable_height = 350;
  int corner_x = 50;
  int corner_y = 50;
  
  ArrayList<String> textbox_labels = new ArrayList<String>();
  textbox_labels.add("Gender");
  textbox_labels.add("Age");
  textbox_labels.add("Interests");
  textbox_labels.add("Race");
  textbox_labels.add("Profession");
  
  int n_boxes = textbox_labels.size();
  int box_height = usable_height/n_boxes;
  int box_width = 100;
  
  emptyBox = new TextBox("", 0, 0, 0, 0);
  emptyMenuInput = new Menu(emptyBox, corner_x + box_width, corner_y, usable_width - box_width, usable_height, true);
  emptyMenuOutput = new Menu(emptyBox, corner_x + 2*box_width, corner_y + usable_height + 25, usable_width - 2*box_width, usable_height, true);
  matchRateBox = new TextBox("Match Rate: --", corner_x + 2*box_width + 25, corner_y + usable_height + 50, 4*box_width/2, 3*usable_height/10);
  
  for (int i = 0; i < n_boxes; i++)
  {
    textBoxes.add(new TextBox(textbox_labels.get(i), corner_x, corner_y + box_height*i, box_width, box_height));
    labelResultBoxes.add(new TextBox(textbox_labels.get(i), corner_x, corner_y + usable_height + 25 + box_height*i, box_width, box_height));
    resultBoxes.add(new TextBox("--", corner_x + box_width, corner_y + usable_height + 25 + box_height*i, box_width, box_height));
  }
  
  menus.add(new Menu(textBoxes.get(0), corner_x + box_width, corner_y, usable_width - box_width, usable_height, true));
  menus.add(new Menu(textBoxes.get(1), corner_x + box_width, corner_y, usable_width - box_width, usable_height, true));
  menus.add(new Menu(textBoxes.get(2), corner_x + box_width, corner_y, usable_width - box_width, usable_height, false));
  menus.add(new Menu(textBoxes.get(3), corner_x + box_width, corner_y, usable_width - box_width, usable_height, true));
  menus.add(new Menu(textBoxes.get(4), corner_x + box_width, corner_y, usable_width - box_width, usable_height, true));
  
  menus.get(0).addButton("M", 10);
  menus.get(0).addButton("F", 10);
  
  menus.get(1).addButton("18-25", 10);
  menus.get(1).addButton("26-40", 10);
  menus.get(1).addButton("41-69", 10);
  
  menus.get(2).addButton("Reading", 10);
  menus.get(2).addButton("Sports", 10);
  menus.get(2).addButton("Animals", 10);
  
  menus.get(3).addButton("Caucasian", 10);
  menus.get(3).addButton("Asian", 10);
  menus.get(3).addButton("Black", 10);
  
  menus.get(4).addButton("Engineer", 10);
  menus.get(4).addButton("Lawyer", 10);
  menus.get(4).addButton("Doctor", 10);
  
  p = new Person(usable_width + corner_x - 200, corner_y, 200, usable_height);
  m = new Person(usable_width + corner_x - 200, corner_y + usable_height + 25, 200, usable_height);
}

void draw() {
  update(mouseX, mouseY);
  emptyMenuInput.showMenu();
  emptyMenuOutput.showMenu();
  matchRateBox.drawTextBox();
  for (int i = 0; i < textBoxes.size(); i++)
  {
    textBoxes.get(i).drawTextBox();
    labelResultBoxes.get(i).drawTextBox();
    resultBoxes.get(i).drawTextBox();
  }
  for (int i = 0; i < menus.size(); i++)
  {
    if (menus.get(i).isActive()) {
      menus.get(i).showMenu();
    }
  }
  p.drawBasicForm();
  m.drawBasicForm();
}

void mousePressed() {
  ///Checks to see if any selection has to be made
  checkSelectedTextBox();
  checkSelectedButtonInMenu();
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

void checkSelectedButtonInMenu() {
  ///Checks if there are any buttons being selected; if so, makes the necessary changes
  boolean changeState = false;
  int menu_index_change = -1;
  int button_index_change = -1;
  
  //Sees if any buttons are currently being hovered over and gets the corresponding index
  for (int i = 0; i < menus.size(); i++)
  {
    if (menus.get(i).isActive()) {
      ArrayList<Button> buttons = menus.get(i).getButtons();
      for (int j = 0; j < buttons.size(); j++) {
        if (buttons.get(j).isHovered())
        {
          changeState = true;
          menu_index_change = i;
          button_index_change = j;
          break;
        }
      }
      break;
    }
  }
  
  //Uses the index from the previous step to make the necessary changes to person
  if (menu_index_change != -1 && button_index_change != -1) {
    String menu_label = menus.get(menu_index_change).getFatherLabel();
    menus.get(menu_index_change).selectButton(button_index_change);
    
    if (menu_label == "Gender") {
      p.setGender(menus.get(menu_index_change).getButtons().get(button_index_change).getLabel());
    }
    else if (menu_label == "Age") {
      p.setAge(menus.get(menu_index_change).getButtons().get(button_index_change).getLabel());
    }
    else if (menu_label == "Race") {
      p.setRace(menus.get(menu_index_change).getButtons().get(button_index_change).getLabel());
    }
    else if (menu_label == "Profession") {
      p.setProfession(menus.get(menu_index_change).getButtons().get(button_index_change).getLabel());
    }
    else if (menu_label == "Interests") {
      p.addInterest(menus.get(menu_index_change).getButtons().get(button_index_change).getLabel());
    }
    calculateOutput();
    resultBoxes.get(0).setLabel(m.getGender());
    resultBoxes.get(1).setLabel(m.getAge());
    resultBoxes.get(3).setLabel(m.getRace());
    resultBoxes.get(4).setLabel(m.getProfession());
  }
  
}

void calculateOutput() {
  if (p.getGender() == "F")
    m.setGender("M");
  else if (p.getGender() == "M")
    m.setGender("F");
  
  m.setAge(p.getAge());
  
  if (p.getRace() == "Black") {
    m.setRace("Black");
    matchRateBox.setLabel("Match Rate: 60%");
  }
  else if (p.getRace() == "Asian") {
    m.setRace("Caucasian");
    matchRateBox.setLabel("Match Rate: 51%");
  }
  else if (p.getRace() == "Caucasian") {
    if (p.getGender() == "M") {
      m.setRace("Asian");
      matchRateBox.setLabel("Match Rate: 54%");
    }
    else if (p.getGender() == "F") {
      m.setRace("Caucasian");
      matchRateBox.setLabel("Match Rate: 46%");
    }
  }
  
  if (p.getProfession() != "" && p.getRace() == "Asian")
    m.setProfession("Engineer");
  else if (p.getProfession() != "" && p.getRace() == "Caucasian")
    m.setProfession("Lawyer");
}

void update(int mousex, int mousey) {
  updateTextBoxes(mousex, mousey);
  updateButtons(mousex, mousey);
}

void updateTextBoxes(int mousex, int mousey) {
  ///Checks if any text boxes are currently being hovered over
  for (int i = 0; i < textBoxes.size(); i++)
  {
    TextBox tb = textBoxes.get(i);
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

void updateButtons(int mousex, int mousey) {
  ///Checks if any buttons are currently being hovered over
  for (int j = 0; j < menus.size(); j++) {
    if (menus.get(j).isActive()) {
      ArrayList<Button> buttons = menus.get(j).getButtons();
      for (int i = 0; i < buttons.size(); i++)
      {
        Button but = buttons.get(i);
        int size = but.getSize();  
        if (but.isCheckBox()) 
        {
          int x = but.getX();
          int y = but.getY();
          if (mousex >= x && mousex <= x+size && mousey >= y && mousey <= y+size) {
            buttons.get(i).setHovered(true);
          }
          else
            buttons.get(i).setHovered(false);
        } 
        else if (but.isRadius()) 
        {
          float x = but.getCenterX();
          float y = but.getCenterY();
          float disX = x - mousex;
          float disY = y - mousey;
          if (sqrt(sq(disX) + sq(disY)) < size/2 ) {
            buttons.get(i).setHovered(true);
          } 
          else
            buttons.get(i).setHovered(false);
        }
      }
    }
  }
}

