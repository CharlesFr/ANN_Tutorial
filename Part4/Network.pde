/*

 Charles Fried - 2017
 ANN Tutorial 
 Part #2
 
 NETWORK
 
 This class is for the neural network, which is hard coded with three layers: input, hidden and output
 
 */


ArrayList connec = new ArrayList();
ArrayList conStr = new ArrayList();

class Network {

  Neuron [] input_layer;
  Neuron [] hidden_layer;
  Neuron [] output_layer;
  int bestIndex = 0;

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

  void respond(Card card) {

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

    drawCon();

    // Draw the input layer
    for (int i = 0; i < input_layer.length; i++) {
      pushMatrix();
      translate(
        (i%14) * height / 20.0 + width * 0.05, 
        (i/14) * height / 20.0 + height * 0.13);
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
    float [] resp = new float [output_layer.length];
    float respTotal = 0.0;
    for (int k = 0; k < output_layer.length; k++) {
      resp[k] = output_layer[k].output;
      respTotal += resp[k]+1;
    }

    for (int k = 0; k < output_layer.length; k++) {
      pushMatrix();
      translate(
        width * 0.85, 
        (k%10) * height / 15.0 + height * 0.2);
      output_layer[k].display();
      fill(150);
      strokeWeight(sq(output_layer[k].output)/2);
      line(12, 0, 25, 0);
      text(k%10, 40, 5);
      text(nfc(((output_layer[k].output+1)/respTotal)*100, 2) + "%", 55, 5);
      popMatrix();
      strokeWeight(1);
    }
    float best = -1.0;
    for (int i =0; i < resp.length; i++) {
      if (resp[i]>best) {
        best = resp[i];
        bestIndex = i;
      }
    }
    stroke(255, 0, 0);
    noFill();
    ellipse(
      width * 0.85, (bestIndex%10) * height / 15.0 + height * 0.2, 
      25, 25);
  }

  void train(float [] outputs) {
    // adjust the output layer
    for (int k = 0; k < output_layer.length; k++) {
      output_layer[k].setError(outputs[k]);
      output_layer[k].train();
    }
    float best = -1.0;
    for (int i = 0; i < output_layer.length; i++) {
      if (output_layer[i].output > best) bestIndex = i;
    }
    // propagate back to the hidden layer
    for (int j = 0; j < hidden_layer.length; j++) {
      hidden_layer[j].train();
    }

    // The input layer doesn't learn: it is the input and only that
  }

  void drawCon() {

    for (int i = 0; i < hidden_layer.length; i++) {
      float [] res = hidden_layer[i].getStrength();
      stroke(200);
      strokeWeight(pow(10, res[1])/35);
      line(
        (i%7) * height / 20.0 + width * 0.53, 
        (i/7) * height / 20.0 + height * 0.32, 
        (int(res[0])%14) * height / 20.0 + width * 0.05, 
        (int(res[0])/14) * height / 20.0 + height * 0.13);
    }

    for (int i = 0; i < output_layer.length; i++) {
      float [] res = output_layer[i].getStrength();
      stroke(res[1]*200);
      strokeWeight(pow(10, res[1])/35);
      line(
        width * 0.85, 
        (i%10) * height / 15.0 + height * 0.2,
        (res[0]%7) * height / 20.0 + width * 0.53, 
        (res[0]/7) * height / 20.0 + height * 0.32);
    }
    strokeWeight(1);
  }
}