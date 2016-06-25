import java.util.ArrayList;

Table table;
ArrayList<TextBox> textBoxes = new ArrayList<TextBox>();
ArrayList<Menu> menus = new ArrayList<Menu>();
int indexCurrentlySelected = -1;

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
  int usable_height = 700;
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
  for (int i = 0; i < n_boxes; i++)
  {
    textBoxes.add(new TextBox(textbox_labels.get(i), corner_x, corner_y + box_height*i, box_width, box_height));
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
  
}

void draw() {
  update(mouseX, mouseY);
  for (int i = 0; i < textBoxes.size(); i++)
  {
    textBoxes.get(i).drawTextBox();
  }
  for (int i = 0; i < menus.size(); i++)
  {
    if (menus.get(i).isActive()) {
      menus.get(i).showMenu();
    }
  }
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
  
  //Uses the index from the previous step to make the necessary changes
  if (menu_index_change != -1 && button_index_change != -1)
    menus.get(menu_index_change).selectButton(button_index_change);
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

