public class Board {
  Alien [][] aliens;
  private float[] posX = {50, 150, 250, 350, 450, 550, 650, 750, 850, 950};
  private float[] posY = {75, 150, 225, 300, 375, 450, 525, 600, 675, 750};
  int nbRow;
  
  
  
  public Board(){
    this.nbRow = 4;
    this.aliens = new Alien[posX.length][nbRow];
    for (int i = 0 ; i < posX.length ; i++) {
      for (int j = 0 ; j < nbRow ; j++) {
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
  
  void display() {
    for (int i = 0 ; i < aliens.length ; i++) {
      for (int j = 0 ; j < nbRow ; j++) {
        aliens[i][j].display();
      }
    }
  }
  
  void updateAlienPos(){
   if (nbFrame%500==0 && nbFrame!=0) {
     for (int i = 0 ; i < aliens.length ; i++) {
      for (int j = 0 ; j < nbRow ; j++) {
        aliens[i][j].setPosY(aliens[i][j].getPosY()+75);
      }
    }
   }
  }
  
}
