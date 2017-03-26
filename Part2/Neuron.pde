/*

 Charles Fried - 2017
 ANN Tutorial 
 Part #2
 
 NEURON
 
 This class is for the neural network, which is hard coded with three layers: input, hidden and output
 
 */

class Neuron {

  Neuron [] inputs; // Strores the neurons from the previous layer
  float [] weights;
  float output;

  Neuron() {
  }

  Neuron(Neuron [] p_inputs) {
    
    inputs = new Neuron [p_inputs.length];
    weights = new float [p_inputs.length];
    for (int i = 0; i < inputs.length; i++) {
      inputs[i] = p_inputs[i];
      weights[i] = random(-1.0, 1.0);
    }
  }
  
  void respond() {

    float input = 0.0;
    for (int i = 0; i < inputs.length; i++) {
      input += inputs[i].output * weights[i];
    }
    output = lookupSigmoid(input);
  }

  void display() {
    fill(128 * (1 - output));
    ellipse(0, 0, 16, 16);
  }
}