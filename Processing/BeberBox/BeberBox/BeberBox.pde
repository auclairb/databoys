import java.util.ArrayList;

Table table;
ArrayList<TextBox> textBoxes = new ArrayList<TextBox>();
ArrayList<Button> buttons = new ArrayList<Button>();
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
  
  textBoxes.add(new TextBox("Testando", 30, 100, 50, 50));
  textBoxes.add(new TextBox("Testando de novo", 30, 150, 50, 90));
  
  buttons.add(new Button("Button teste", 0, 0, 1, 15));
}

void draw() {
  update(mouseX, mouseY);
  for (int i = 0; i < textBoxes.size(); i++)
  {
    textBoxes.get(i).drawTextBox();
  }
  for (int i = 0; i < buttons.size(); i++)
  {
    buttons.get(i).drawButton();
  }
}

void mousePressed() {
  ///Checks to see if any selection has to be made
  checkSelectedTextBox();
  checkSelectedButton();

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

void checkSelectedButton() {
  ///Checks if there are any buttons being selected; if so, makes the necessary changes
  boolean changeState = false;
  int index_change = -1;
  
  //Sees if any buttons are currently being hovered over and gets the corresponding index
  for (int i = 0; i < buttons.size(); i++)
  {
    if (buttons.get(i).isHovered())
    {
      changeState = true;
      index_change = i;
      break;
    }
  }
  
  //Uses the index from the previous step to make the necessary changes
  if (index_change != -1)
    buttons.get(index_change).setSelected(true);
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
  for (int i = 0; i < buttons.size(); i++)
  {
    Button but = buttons.get(i);
    
    if (but.isActive())
    {
      int size = but.getSize();  
      if (but.isCheckBox()) {
        int x = but.getX();
        int y = but.getY();
        if (mousex >= x && mousex <= x+size && mousey >= y && mousey <= y+size) {
          buttons.get(i).setHovered(true);
        }
        else
          buttons.get(i).setHovered(false);
      } 
      else if (but.isRadius()) {
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

