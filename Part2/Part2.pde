/*

 Charles Fried - 2017
 ANN Tutorial 
 Part #1
 
 MAIN TAB
 
 */


int cardNum = int(random(2000));

Network neuralnet;

void setup() {

  size(1000, 400);
  setupSigmoid();
  loadData();
  neuralnet = new Network(196, 49, 10);
  smooth();
  stroke(150);
}

void draw() {

  neuralnet.respond(testing_set[cardNum]);
  background(255);
  neuralnet.display();
  
  fill(100);
  text("Card number: #" + cardNum, width*0.05, height*0.9);
  text("Card label: " + testing_set[cardNum].output, width*0.05, height*0.95);
}

void mousePressed() {
  cardNum = int(random(2000));
}