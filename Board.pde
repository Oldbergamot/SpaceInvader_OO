public class Board {
  
  Alien [][] aliens;
  private float[] posX = {50, 150, 250, 350, 450, 550, 650, 750, 850, 950};
  private float[] posY = {75, 150, 225, 300, 375, 450, 525, 600, 675, 750};
  int nbLine;
  int shipPos;
  int nbWave;  
  boolean levelOver;
  
  /*
  board constructor
  */
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
  
  boolean isGameOver() {
    return (aliens[0][lastLine()].getPosY()>=shipPos && player.getLife() == 0);
  }
  
  boolean hasAlienReachedPlayer() {
    if(aliens[0][lastLine()].getPosY()>=shipPos) return true;
    return false;
  }
  
  /*
  return the number of the line of the closest alien
  */
  int lastLine(){
   int i =3;
   for ( i = 3 ; i >= 0 ; i--) { //4 lignes donc case 3
      for (int j = 0 ; j < 10 ; j++) {
        if (aliens[j][i].isHit()==false) return i;
      }
    }
   return 0;
  }
  
  /*
  display every Alien
  */
  void display() {
    for (int i = 0 ; i < aliens.length ; i++) {
      for (int j = 0 ; j < nbLine ; j++) {
        aliens[i][j].display();
      }
    }
  }
  
  /*
  update the aliens positions every 6 seconds
  */
  void updateAlienPos(){
    
    if(isWaveOver()) sendNextWave(upDateNbWave());
    
    /*
    check for frame update
    */
    if (nbFrame%360==0 && nbFrame!=0) {
      if(this.isGameOver()) levelOver = true; //not sure it has to stay there
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
     
  /*
  set the aliens to their original positions;
  */
  void resetWave() {
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
  
  int upDateNbWave() {
    return ++this.nbWave;
  }
  
  /*
  check if the trajectory of the laser match with any aliens' position
  */
  void updateAlienHit(){
     float xLaser = laser.getPos().getPosX();
     float yLaser = laser.getPos().getPosY();
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
           if(aliens[i][j].getPv()!=0){ 
             aliens[i][j].setIsHit(true);   
             aliens[i][j].removePv();
             aliens[i][j].setHitTime(millis());
             player.setScore();
             laser.resetLaser();         
           }
         }
       }
     }
   }  
}
