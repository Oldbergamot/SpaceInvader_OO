Board board;
Player player;
Laser laser;
int nbFrame = 0;


void setup() {
  
  
  size(1000,800);
  background(0);
  imageMode(CENTER);
  board = new Board();
  player = new Player();
  laser = new Laser();
  

}

void draw() {
  nbFrame++;
  
  background(0);
  laser.update();
  updateAlienHit();
  board.updateAlienPos();
  println(nbFrame);
  
  board.display();
  laser.display();
  player.display();
}
  void updateAlienHit(){
   float xLaser = laser.getPos().getPosX();
   float yLaser = laser.getPos().getPosY();
   Alien[][] aliens = board.getAliens();
   float xAlien;
   float yAlien;
   float minXAlien;
   float maxXAlien;
   float minYAlien;
   float maxYAlien;
   for (int i = 0 ; i < aliens.length ; i++) {
     for (int j = 0 ; j < aliens[0].length; j++) {
       xAlien = aliens[i][j].getPosX();
       yAlien = aliens[i][j].getPosY();
       minXAlien = xAlien-33;
       maxXAlien = xAlien+33;
       minYAlien = yAlien -23;
       maxYAlien = yAlien + 23;
       if(xLaser >= minXAlien && xLaser <= maxXAlien && yLaser >= minYAlien && yLaser <= maxYAlien) {
         if(!board.getAlien(i,j).isHit()){  
         board.setAliensHit(i , j , true);
         laser.resetFire();
         }
       }
     }
   }
 }

void keyPressed() {
   if (keyPressed == true && key == CODED && keyCode == LEFT && player.getPosX()>25) player.move(Direction.LEFT);
   if (keyPressed == true && key == CODED && keyCode == RIGHT && player.getPosX()<width-25)player.move(Direction.RIGHT);
   if (keyPressed && key == 32 && !laser.getFire()) laser.fire();
}
