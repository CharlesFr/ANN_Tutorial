/*

Charles Fried - 2017
ANN Tutorial 
Part #1

MAIN TAB

*/

Card [] testing_set; // the set we use to train (2000)
Card [] training_set; // the set we use to train (8000)
int cardNum = int(random(2000));


void setup(){
  textFont(createFont("HelveticaNeue-Light-15.vlw", 14));
  size(800,300);
  loadData();
  stroke(100);
}

void draw(){
  background(255);
  for(int i = 0;i < testing_set[cardNum].inputs.length; i++){
      pushMatrix();
      translate((i%14) * height / 20.0 + width * 0.05, (i/14) * height / 20.0 + height * 0.15);
      fill((0.5-testing_set[cardNum].inputs[i]*0.5) *255);
      ellipse(0,0,12,12);
      popMatrix();
  }
  
  fill(100);
  text("Card number: #" + cardNum, width*0.5, height*0.45);
  text("Card tag: " + testing_set[cardNum].output, width*0.5, height*0.5);
}

void mousePressed(){
  cardNum = int(random(2000));
}