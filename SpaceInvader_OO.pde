Board board;
Player player;
Laser laser;
ScoreBoard scoreBoard;
int nbFrame = 0;


void setup() {
  
  
  size(1000,1000);
  background(0);
  imageMode(CENTER);
  board = new Board();
  player = new Player();
  laser = new Laser();
  scoreBoard = new ScoreBoard();

}

void draw() {
  if(!board.isGameOver()){
  
    nbFrame++;
    println(nbFrame);
    
    background(0);
    laser.updateLaserPosition();
    board.updateAlienHit();
    board.updateAlienPos();
    
    board.display();
    laser.display();
    player.display();
    player.move();
    scoreBoard.displayScoreBoard();
  }
  
  if(board.isGameOver()) displayGameOver();
  if (player.getScore()==7920) displayWin(); //maximal score
}

void displayGameOver(){
  background(0);
  PFont f;
  f = createFont("Arial",16,true);
  textFont(f,72);
  fill(255);
  textAlign(CENTER);    
  text("Game Over",width/2,height/2);
}

void displayWin() {
  background(0);
  PFont f;
  f = createFont("Arial",16,true);
  textFont(f,72);
  fill(255);
  textAlign(CENTER);
  text("Congratulation!",width/2,height/2);
  textFont(f,56);
  text("You've defeated the alien invasion!",width/2,height/10*6);
}

void keyPressed() {
   if (keyPressed == true && key == CODED && keyCode == LEFT && player.getPosX()>25) {
     Direction.RIGHT.setDir(false);
     Direction.LEFT.setDir(true);     
     player.move(); //Direction.LEFT
   }     
   if (keyPressed == true && key == CODED && keyCode == RIGHT && player.getPosX()<width-25) {
     Direction.LEFT.setDir(false);
     Direction.RIGHT.setDir(true);     
     player.move(); //Direction.RIGHT
   }     
   if (keyPressed && key == 32 && !laser.getFire()) {
     laser.fire();
   }
}

void keyReleased() {
  if (key == CODED && keyCode == LEFT) Direction.LEFT.setDir(false);
  if (key == CODED && keyCode == RIGHT) Direction.RIGHT.setDir(false); 
}
