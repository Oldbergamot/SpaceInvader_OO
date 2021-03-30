public enum AlienType {
  TYPE1(1),
  TYPE2(2),
  TYPE3(2),
  TYPE4(2),
  TYPE5(2),
  TYPE6(3),
  TYPE7(3),
  TYPE8(3),
  TYPE9(4); 
  
  
  int pv;
  
  private AlienType(int pv){
    this.pv = pv;
  }
  
  public int getPv(){
    return this.pv;
  }
}
