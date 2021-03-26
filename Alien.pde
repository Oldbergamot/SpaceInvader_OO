public class Alien {
  
  Position position;
  boolean isHit;
  PImage image;
  AlienType type;
  
  Alien (Position position, AlienType type) {
   this.position = position;
   this.isHit = false;
   if ( type.equals(AlienType.TYPE1)) {
     this.image = loadImage("alien1.png");
   }
  }
  
  float getPosX() {
    return this.position.getPosX();
  }
  float getPosY() {
   return this.position.getPosY(); 
  }
  void setPosX(float x) {
    this.position.setPosX(x);
  }
  void setPosY(float y) {
    this.position.setPosY(y);
  }
  
  PImage getImage() {
    return this.image;
  }
  void setIsHit(boolean b) {
   this.isHit = b; 
  }
  
  boolean isHit(){
    return this.isHit;  
  }
  
  void updateAlienPosition(){
   this.position.setPosY(this.getPosY()+75); 
  }
  
  void display() {
   if (!isHit) {
     image(image, position.getPosX(), position.getPosY());
   }
  }
}
