class FTweet extends FBox {
 
  String name;
  String msg;
  
  FTweet(String _msg, String _name, PImage _p) {
    super(gridSize, gridSize);
    msg = _msg;
    name = _name;

    this.setPosition(50, height/2 - 100);
    this.setStatic(true);
    this.setName("tweet msg");
    this.attachImage(_p);
    this.setSensor(true);

    world.add(this);
  }

  void show() {
    fill(aqua);
    stroke(aqua);
    rect(-1, 100, width + 2, 150);
    textSize(15);
    fill(white);
    text(name, this.getX() + 35, this.getY()- 10);
    text(msg, this.getX() + 35, this.getY(), 500, 100);
  }
  
}
