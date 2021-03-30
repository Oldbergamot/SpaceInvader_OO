class ScoreBoard{
  
  int a; //length
  int b; //heitgh
  Position position;
  PImage heart;
  PImage noHeart;
  
  ScoreBoard(){
   this.a = 1000;
   this.b = 200;
   this.position = new Position(900,900);
   this.heart = loadImage("heart.png");
   this.noHeart = loadImage("noheart.png");
  }
  
  void displayLife() {
    int life = player.getLife();
    int difference = 3-life;
    for (int i = 1 ; i <= life ; i++) {
     image(heart, 100*i,900);
    }    
    switch (difference) {
      case 1 : 
        image(noHeart,300,900);
        break;
      case 2 : 
        image(noHeart,300,900);
        image(noHeart,200,900);
        break;
      case 3 :
        image(noHeart,300,900);
        image(noHeart,200,900);
        image(noHeart,100,900);
        break;
    }    
  }
  
  void displayScoreBoard() {
    displayLife();
    displayScore();
  }
  
  void displayScore() {
    PFont f;
    f = createFont("Arial",2,true);
    textFont(f,48);
    fill(255);
    textAlign(CENTER);    
    text("Score : "+player.getScore(),width/10*7,height/10*9);
  }
  
}
