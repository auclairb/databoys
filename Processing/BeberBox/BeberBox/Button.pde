class Button {
  private boolean radiusButton;
  private boolean checkboxButton;
  private String label;
  private boolean marked;
  
  private boolean hovered;
  private boolean selected;
  private boolean active = true;
  
  private int menuIndex = -1;
  
  private int x;
  private int y;
  private int size; //diameter for radius button, side of square for checkbox button
  
  public Button(String label, int x, int y, int type, int size) {
    //Gets button parameters
    this.x = x;
    this.y = y;
    this.label = label;
    this.size = size;
    
    if (type == 1) {
      radiusButton = true;
      checkboxButton = false;
    }
    else if (type == 0) {
      checkboxButton = true;
      radiusButton = false;
    }
    else
      println("Only values 1 or 0 allowed for type attribute");
  }
  
  public void drawButton() {
    //Checks if button is radius or checkbox and draws the corresponding form and text
    stroke(0);
    
    if (isSelected())
    {
      fill(color(125));
    }
    else if (isHovered())
    {
      fill(color(200));
    }
    else
      fill(color(255));
      
    if (radiusButton) {
      ellipse(x+size/2, y+size/2, size, size);  
    }
    
    else if (checkboxButton) {
      rect(x, y, size, size);
    }
    
    fill(color(0));
    text(label, x + 5*size/4, y + 3*size/4);
  }
  
  public boolean isMarked() {
    return marked;
  }
  
  public boolean isRadius() {
    return radiusButton;
  }
  
  public boolean isCheckBox() {
    return checkboxButton;
  }
  
  public boolean isHovered() {
    return hovered;
  }
  
  public boolean isSelected() {
    return selected;
  }
  
  public boolean isActive() {
    return active;
  }
  
  public void setHovered(boolean state) {
    hovered = state;
  }
  
  public void setSelected(boolean state) {
    selected = state;
  }
  
  public void setActive(boolean state) {
    active = state;
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  public float getCenterX() {
    return x + size/2;
  }
  public float getCenterY() {
    return y + size/2;
  }
  
  public int getSize() {
    return size;
  }
  
  public String getLabel() {
    return label;
  }
}
