public class Player {
  
  Position position;
  PImage image;
  float speed;
  
  
  Player() {
    position = new Position(width/2, height/8*7);
    this.image = loadImage("player.png");
    this.speed = 10;
  }
  void move(Direction direction) {
    if(direction.equals(Direction.LEFT)) this.setPosX(position.getPosX()-speed);
    if(direction.equals(Direction.RIGHT)) this.setPosX(position.getPosX()+speed);
  }
  
  float getPosX(){
   return this.position.getPosX(); 
  }
  
  void setPosX(float x){
    this.position.setPosX(x);
  }  
   
  Position getPosition() {
    return this.position;
  }
  
  void display() {
    image(image, position.getPosX(), position.getPosY());
  }
  
  void fire() {
    
  }
  
}
