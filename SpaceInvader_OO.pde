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
    
    background(0);
    laser.update();
    board.updateAlienHit();
    board.updateAlienPos();
    
    board.display();
    laser.display();
    player.display();
    scoreBoard.displayScoreBoard();
  }
  else {
   displayGameOver(); 
  }
}

void displayGameOver(){
  background(0);
  PFont f;
  f = createFont("Arial",16,true);
  textFont(f,72);
  fill(255);
  textAlign(CENTER);    
  text("Game Over",width/2,height/2);
  //println("gameover");
}

void keyPressed() {
   if (keyPressed == true && key == CODED && keyCode == LEFT && player.getPosX()>25) player.move(Direction.LEFT);
   if (keyPressed == true && key == CODED && keyCode == RIGHT && player.getPosX()<width-25)player.move(Direction.RIGHT);
   if (keyPressed && key == 32 && !laser.getFire()) laser.fire();
}