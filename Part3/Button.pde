class Button {

  PVector pos;
  String name;
  int radius = 20;

  Button(float _x, float _y, String _name) {
    pos = new PVector(_x, _y);
    name = _name;
  }

  void display() {
    if (hover()) fill(220);
    else noFill();
    stroke(150);
    ellipse(pos.x, pos.y, radius*2, radius*2);
    fill(150);
    text(name, pos.x-13, pos.y+4);
  }

  boolean hover() {
    PVector mouse = new PVector(mouseX, mouseY);
    if (mouse.dist(pos) < radius) return true;
    else return false;
  }
}