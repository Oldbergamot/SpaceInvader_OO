public class Board {
  Alien [][] aliens;
  private float[] posX = {50, 150, 250, 350, 450, 550, 650, 750, 850, 950};
  private float[] posY = {75, 150, 225, 300, 375, 450, 525, 600, 675, 750};
  int nbLine;
  int shipPos;
  int nbWave;
  
  boolean levelOver;
  
  
  
  public Board(){
    this.nbLine = 4;
    this.nbWave = 1;
    this.shipPos = 750;
    this.levelOver = false;
    this.aliens = new Alien[posX.length][nbLine];
    for (int i = 0 ; i < posX.length ; i++) {
      for (int j = 0 ; j < nbLine ; j++) {
        aliens[i][j] = new Alien(new Position(posX[i], posY[j]), AlienType.TYPE1);
      }
    }
  }
  
  Alien [][] getAliens() {
    return this.aliens;
  }
  Alien getAlien(int i , int j) {
    return aliens[i][j];
  }
  
  void setAliensHit(int i , int j , boolean b){
   this.aliens[i][j].setIsHit(b); 
  }
  
  boolean isGameOver() {
    return (aliens[0][lastLine()].getPosY()>=shipPos && player.getLife() == 0);
  }
  
  boolean hasAlienReachedPlayer() {
    if(aliens[0][lastLine()].getPosY()>=shipPos) return true;
    return false;
  }
 
  int lastLine(){

   int i =3;
   for ( i = 3 ; i >= 0 ; i--) { //4 lignes donc case 3
      for (int j = 0 ; j < 10 ; j++) {
        if (aliens[j][i].isHit()==false) return i;
      }
    }
   return 0;
  }
  
  void display() {
    for (int i = 0 ; i < aliens.length ; i++) {
      for (int j = 0 ; j < nbLine ; j++) {
        aliens[i][j].display();
      }
    }
  }
  
  void updateAlienPos(){
    /*
    check for frame update
    */
    if(isWaveOver()) sendNextWave(upDateNbWave());
   if (nbFrame%360==0 && nbFrame!=0) {
     if(this.isGameOver()) {
       levelOver = true;
     }
     if (hasAlienReachedPlayer()) {
       resetWave();
       player.removeLife();
     }       
     else{
     for (int i = 0 ; i < aliens.length ; i++) {
      for (int j = 0 ; j < nbLine ; j++) {
        aliens[i][j].setPosY(aliens[i][j].getPosY()+75);
      }
     }
    }
   }
  }
  
  void resetWave() {
    test();
    println(" ");
    println(lastLine());
    println("");
    for (int i = 0 ; i < posX.length ; i++) {
      for (int j = 0 ; j < nbLine ; j++) {
        aliens[i][j].setPosX(posX[i]);
        aliens[i][j].setPosY(posY[j]);
      }
    }
  }
  
  void sendNextWave(int nbWave) {
    AlienType type = AlienType.TYPE1;
    switch (nbWave) {
     case 1 : type = AlienType.TYPE1;
     break;
     case 2 : type = AlienType.TYPE2;
     break;
     case 3 : type = AlienType.TYPE3;
     break;
     case 4 : type = AlienType.TYPE4;
     break;
     case 5 : type = AlienType.TYPE5;
     break;
     case 6 : type = AlienType.TYPE6;
     break;
     case 7 : type = AlienType.TYPE7;
     break;
     case 8 : type = AlienType.TYPE8;
     break;
     case 9 : type = AlienType.TYPE9;
     break;
    }
    for (int i = 0 ; i < posX.length ; i++) {
      for (int j = 0 ; j < nbLine ; j++) {
        aliens[i][j] = new Alien(new Position(posX[i], posY[j]), type);
      }
    }
  }
  
  boolean isWaveOver() {
    for (int i = 0 ; i < aliens.length ; i++) {
      for (int j = 0 ; j < nbLine ; j++) {
        if(aliens[i][j].getPv()!=0) return false;
      }
     }
     return true;
  }
  
  void test () {
   for ( int i = 3 ; i >= 0 ; i--) { //4 lignes donc case 3
      for (int j = 0 ; j < 10 ; j++) {
        println("posX : " +aliens[j][i].getPosX()+ " posY : " +aliens[j][i].getPosY()+ " isHit : " + aliens[j][i].isHit());          
      }
    }
  }
  
  int upDateNbWave() {
    return ++this.nbWave;
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
       if(xLaser >= minXAlien && xLaser <= maxXAlien && yLaser >= minYAlien && yLaser <= maxYAlien && laser.getFire()) {
         //if(!board.getAlien(i,j).isHit()){  
         if(board.getAlien(i,j).getPv()!=0){ 
         board.setAliensHit(i , j , true);
         aliens[i][j].removePv();
         aliens[i][j].setHitTime(millis());
         player.setScore();
         laser.resetFire();         
         }
       }
     }
   }
 }

  
}
