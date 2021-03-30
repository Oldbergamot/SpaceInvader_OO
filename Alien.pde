public class Alien {
  
  Position position;
  boolean isHit;
  boolean isTabDone = false;
  PImage []aliensImage;
  PImage []aliensHitImage;
  PImage image;
  PImage imageHit;
  int pv;
  int hitTime;
  AlienType type;
  
  Alien (Position position, AlienType type) {
   this.position = position;
   this.isHit = false;
   this.pv = type.getPv();
   this.type = type;
   
   if(!isTabDone) generateTab();
   
   switch (type) {
     case TYPE1 : this.image = aliensImage[0];this.imageHit = aliensHitImage[0];
     break;
     case TYPE2 : this.image = aliensImage[1];this.imageHit = aliensHitImage[1];
     break;
     case TYPE3 : this.image = aliensImage[2];this.imageHit = aliensHitImage[2];
     break;
     case TYPE4 : this.image = aliensImage[3];this.imageHit = aliensHitImage[3];
     break;
     case TYPE5 : this.image = aliensImage[4];this.imageHit = aliensHitImage[4];
     break;
     case TYPE6 : this.image = aliensImage[5];this.imageHit = aliensHitImage[5];
     break;
     case TYPE7 : this.image = aliensImage[6];this.imageHit = aliensHitImage[6];
     break;
     case TYPE8 : this.image = aliensImage[7];this.imageHit = aliensHitImage[7];
     break;
     case TYPE9 : this.image = aliensImage[8];this.imageHit = aliensHitImage[8];
     break;
   }
  }
  
  void generateTab () {
    this.aliensImage = new PImage[9];
    this.image = loadImage("aliens.png");
    imageMode(CORNER);
   int i = 0;
   for (int y = 0 ; y <image.height ; y+=60){
     for (int x = 0 ; x <image.width ; x+=60){
       image(image,0,0);
       aliensImage[i] = get (x,y, 60,60);
       i++;       
       background(0);
     }
   }
   aliensHitImage = new PImage[9];
   this.image = loadImage("aliensHit.png");
   i =0;
   for (int y = 0 ; y <image.height ; y+=60){
     for (int x = 0 ; x <image.width ; x+=60){
       image(image,0,0);
       aliensHitImage[i] = get (x,y, 60,60);
       i++;       
       background(0);
     }
   }
   
   isTabDone = true;  
   imageMode(CENTER);
    
  }
  int getPv(){
    return this.pv;
  }
  
  void removePv() {
    if(this.pv>0) this.pv--;
  }
  
  AlienType getAlienType() {
    return this.type;
  }
  
  float getPosX() {
    return this.position.getPosX();
  }
  float getPosY() {
   return this.position.getPosY(); 
  }
  void setPosX(float x) {
    this.position.setPosX(x);
  }
  void setPosY(float y) {
    this.position.setPosY(y);
  }
  
  PImage getImage() {
    return this.image;
  }
  void setIsHit(boolean b) {
   this.isHit = b; 
  }
  
  boolean isHit(){
    return this.isHit;  
  }
  
  int timeComparaison;
  
  void setHitTime(int hit) {
    this.hitTime = hit ;
    this.timeComparaison = hit+60;
  }
  
  void updateAlienPosition(){
   this.position.setPosY(this.getPosY()+75); 
  }
  
  void display() {
   //if (!isHit) {
   if (this.getPv()==this.getAlienType().getPv()) {
     image(image, position.getPosX(), position.getPosY());
   }
   if (isHit && pv !=0) this.displayAlienHitV2();
   
   
   //image(imageHit,position.getPosX(), position.getPosY());
  }
  
  boolean b = false;
  /*
  tous les aliens clignottent en fonction du moment où ils ont été touché
  */
  void displayAlienHitV1() {
    if (!b) image(imageHit,position.getPosX(), position.getPosY());
    if (b) image(image, position.getPosX(), position.getPosY());
   //if ( nbFrame%60 == 0 && !b) b = true;
   //if ( nbFrame%120 == 0 && b) b= false; 
   if ( hitTime == timeComparaison+60 && !b) {
     b = true;
     hitTime-=60;
   }
   if ( hitTime == timeComparaison+60 && b) {
     b= false;
     hitTime-=60;
   }
   hitTime++;
  }
  /*
  les aliens clignottent en même temps
  */
  void displayAlienHitV2(){
    if ( nbFrame%60 == 0 && !b) b = true;
    if ( nbFrame%120 == 0 && b) b= false;
    if(b)image(imageHit,position.getPosX(), position.getPosY());
    if(!b)image(image, position.getPosX(), position.getPosY());
    
  }
  
}
