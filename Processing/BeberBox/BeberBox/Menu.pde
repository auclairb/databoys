import java.util.ArrayList;

class Menu {
  private TextBox father;
  private ArrayList<Button> buttons;
  private boolean radiusButton;
  private int selectedButton;
  
  private int x;
  private int y;
  private int w;
  private int h;
  
  public Menu(TextBox father, int x, int y, int w, int h, boolean radiusButton) {
    this.father = father;
    this.radiusButton = radiusButton;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.selectedButton = -1;
    
    this.buttons = new ArrayList<Button>();
  }
  
  public void addButton(String label, int size) {
    int n_buttons = buttons.size(); 
    int but_x = this.x + w/8;
    int but_y = this.y + h/20*(n_buttons+1);
    int buttonType = 0;
    if (radiusButton) {
      buttonType = 1;
    }
    
    buttons.add(new Button(label, but_x, but_y, buttonType, size));
  }
  
  public void drawMenu() {
    fill(color(255));  
    stroke(0);
    rect(x, y, w, h);
  }
  
  public void showMenu() {
    drawMenu();
    for (int i = 0; i < buttons.size(); i++) {
      buttons.get(i).drawButton();
    }
  }
  
  //Useless for now
  public void updateMenu() {
    if (father.isSelected() == true) {
      showMenu();      
    }
  }
  
  public void selectButton(int j) {
    if (radiusButton && selectedButton != -1) {
      buttons.get(selectedButton).setSelected(false);
    }
    buttons.get(j).setSelected(true);
    selectedButton = j;
  }
  
  public boolean isActive() {
    return father.isSelected();
  }
  
  public ArrayList<Button> getButtons() {
    return buttons;
  }
  public TextBox getFather() {
    return father;
  }
  
  
  
}
