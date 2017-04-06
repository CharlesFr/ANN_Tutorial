/*

 Charles Fried - 2017
 ANN Tutorial 
 Part #1
 
 MAIN TAB
 
 Original from Alasdair Turner (c) 2009
 Free software: you can redistribute this program and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 */


int cardNum = int(random(2000));

Network neuralnet;

void setup() {

  size(1000, 400);
  loadData();
  neuralnet = new Network(196);
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
