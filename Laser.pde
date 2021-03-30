public class Laser {
  
  Position position;
  boolean fire;
  float speed;
  float posY;
  
  Laser() {
   this.posY = player.getPosY()-20;
   this.position = new Position(player.getPosX(), posY);
   this.fire = false;
   this.speed = 10;
  }
  
  void display() {
    if(this.fire) {
      fill(#F01111);
      if(position.getPosY()>25) rect(position.getPosX(), position.getPosY(),5,30);
      }
  }
  
  void updateLaserPosition(){
    if(position.getPosY() >= 10 && fire) {
      position.setPosY(position.getPosY()-speed);
    }
    if(this.fire && position.getPosY()==0){
        position.setPosY(posY);
        fire = false;
    }
  }
  
  void resetLaser(){
   this.fire = false;
   this.position = new Position(player.getPosX(), posY);   
  }
  
  Position getPos() {
   return this.position; 
  }
  
  boolean getFire() {
    return this.fire;
  }
  
  void fire() {
    if(!fire){
      fire = true;
      position.setPosX(player.getPosX());
    }
  }
}
