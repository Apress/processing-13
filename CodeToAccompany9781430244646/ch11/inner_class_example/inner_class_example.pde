PClass pc;
void setup(){
  size(400, 400);
  background(0);
  translate(width/2, height/2);pc = new PClass(200);
}

class PClass {
  PClass(float sz){
    ellipse(0, 0, sz, sz);
  }
}
