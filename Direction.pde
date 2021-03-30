public enum Direction {
 RIGHT (false),
 LEFT  (false);
 
 private boolean dir;
 
 private Direction(boolean dir) {
   this.dir=dir;
 }
 
 boolean getDir() {
   return this.dir;
 }
 
 void setDir(boolean b) {
  this.dir=b; 
 }     
}
