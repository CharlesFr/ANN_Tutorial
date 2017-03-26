/*

Charles Fried - 2017
ANN Tutorial 
Part #1

NEURON

The data is a list of 10,000 handwritten digits resampled to a grid of 14x14 pixels by Alasdair Turner
The original set can be found here: http://yann.lecun.com/exdb/mnist/

*/

class Neuron {
  
  float m_output;
  
  void display() {

    // Number is inverted then scaled from 0 to 255    
    fill(128 * (1 - m_output));
    ellipse(0, 0, 16, 16);
  }
}