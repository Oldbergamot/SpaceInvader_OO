public class Player {
  
  Position position;
  PImage image;
  float speed;
  int life;
  int score;
  
  
  Player() {
    position = new Position(width/2, height/10*8);
    this.image = loadImage("player.png");
    this.speed = 7.5;
    this.life = 3;
    this.score = 0;
  }
  void move() {  //(Direction direction)
    if(Direction.RIGHT.getDir() && player.getPosX()<width-25) {
      //if(direction.equals(Direction.RIGHT)) this.setPosX(position.getPosX()+speed);
      this.setPosX(position.getPosX()+speed);
      
    }
    if (Direction.LEFT.getDir() && player.getPosX()>25) {
      //if(direction.equals(Direction.LEFT)) this.setPosX(position.getPosX()-speed);
      this.setPosX(position.getPosX()-speed);
      
    }
      
  }
  
  float getPosX(){
   return this.position.getPosX(); 
  }
  
  float getPosY(){
    return this.position.getPosY();
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
  
  void removeLife(){
   this.life--; 
  }
  int getLife() {
   return life; 
  }
  void setScore(){
    this.score++;
  }
  int getScore(){
    return this.score;
  }
  
}
