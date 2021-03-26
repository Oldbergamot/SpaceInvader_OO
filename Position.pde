public class Position {
  private float posX;
  private float posY;
  
  public Position(float row, float column) {
    this.posX = row;
    this.posY = column;
  }
  
  public float getPosX() {
        return posX;
  }
  
  public float getPosY() {
        return posY;
  }
  
  public void setPosX(float pos){
    this.posX = pos;
  }
  
  public void setPosY(float pos){
    this.posY = pos;
  }
}
