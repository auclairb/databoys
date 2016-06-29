class Button {
  private int h;
  private int w;
  private int x;
  private int y;
  private String text;
  private boolean selected = false;
  private boolean hovered = false;
  
  public Button(String text, int x, int y, int w, int h) {
    this.h = h;
    this.w = w;
    this.text = text;
    this.x = x;
    this.y = y;
  } 
  
  public void drawButton() {
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
      
    stroke(0);
    rect(x, y, w, h,2);
    
    fill(color(0));
    float textS = h/2;
    if (textS > 20)
      textS = 20;
    textSize(textS);
    float textLength = text.length()*textS/2;
    text(text, x + (w - textLength)/2, y + 2.1*h/4);
  }
  
  public boolean isSelected() {
    return selected;
  }
  
  public boolean isHovered() {
    return hovered;
  }
  
  public void setSelected(boolean state) {
    this.selected = state;
  }
  
  public void setHovered(boolean state) {
    this.hovered = state;
  }
  
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  public int getW() {
    return w;
  }
  public int getH() {
    return h;
  }
  public String getLabel() {
    return text;
  }
  
  
}