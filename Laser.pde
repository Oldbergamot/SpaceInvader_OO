public class Laser {
  
  Position position;
  boolean fire;
  float speed;
  
  Laser() {
   this.position = new Position(player.getPosX(), height/8*7-20);
   this.fire = false;
   this.speed = 10;
  }
  
  void display() {
    if(this.fire) {
      fill(#F01111);
      if(position.getPosY()>25) rect(position.getPosX(), position.getPosY(),5,30);
      
      }
  }
  
  void update(){
    if(position.getPosY() >= 10 && fire) {
      position.setPosY(position.getPosY()-speed);
      //println(position.getPosX());
      //println(position.getPosY());
      //println(fire);
    }
    if(this.fire && position.getPosY()==0){
        position.setPosY(height/8*7-20);
        fire = false;
    }
  }
  
  void resetFire(){
   this.fire = false;
   this.position = new Position(player.getPosX(), height/8*7-20);
   
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
      this.updatePosX();
    }
  }
  
  void updatePosX(){
    position.setPosX(player.getPosX());
  }
  
  
}
