/*

 Charles Fried - 2017
 ANN Tutorial 
 Part #2
 
 NETWORK
 
 This class is for the neural network, which is hard coded with three layers: input, hidden and output
 
 */

class Network {

  Neuron [] input_layer;
  Neuron [] hidden_layer;
  Neuron [] output_layer;

  Network(int inputs, int hidden, int outputs) {

    input_layer = new Neuron [inputs];
    hidden_layer = new Neuron [hidden];
    output_layer = new Neuron [outputs];
    
    for (int i = 0; i < input_layer.length; i++) {
      input_layer[i] = new Neuron();
    }
    
    for (int j = 0; j < hidden_layer.length; j++) {
      hidden_layer[j] = new Neuron(input_layer);
    }
    
    for (int k = 0; k < output_layer.length; k++) {
      output_layer[k] = new Neuron(hidden_layer);
    }
  }

  void respond(Card card)
  {
    float [] responses = new float [output_layer.length];
    
    for (int i = 0; i < input_layer.length; i++) {
      input_layer[i].output = card.inputs[i];
    }
    // now feed forward through the hidden layer
    for (int j = 0; j < hidden_layer.length; j++) {
      hidden_layer[j].respond();
    }
    for (int k = 0; k < output_layer.length; k++) {
      output_layer[k].respond();
    }
  }

  void display() {

    // Draw the input layer
    for (int i = 0; i < input_layer.length; i++) {
      pushMatrix();
      translate(
        (i%14) * height / 20.0 + width * 0.05, 
        (i/14) * height / 20.0 + height * 0.15);
      input_layer[i].display();
      popMatrix();
    }

    // Draw the hidden layer
    for (int j = 0; j < hidden_layer.length; j++) {
      pushMatrix();
      translate(
        (j%7) * height / 20.0 + width * 0.53, 
        (j/7) * height / 20.0 + height * 0.32);
      hidden_layer[j].display();
      popMatrix();
    }

    // Draw the output layer
    for (int k = 0; k < output_layer.length; k++) {
      pushMatrix();
      translate(
        width * 0.9, 
        ((k+9)%10) * height / 20.0 + height * 0.24);
      output_layer[k].display();
      popMatrix();
    }
  }
}