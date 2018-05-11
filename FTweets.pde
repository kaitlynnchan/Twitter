class FTweet{
 
  String name,  msg;
  PImage p;
  int followers, x, y, w;
  
  FTweet(String _msg, String _name, PImage _p, int _followers) {
    msg = _msg;
    name = _name;
    p = _p;
    followers = _followers;
    x = 10;
    y = height/2 - 100;
    w = gridSize * 2;
  }

  void show() {
    fill(aqua);
    stroke(aqua);
    rect(-1, 100, width + 2, 150);
    textSize(15);
    fill(black);
    text(name + " : " + followers, x + 90, y - 10);
    fill(white);
    text(name, this.getX() + 35, this.getY()- 10);
    text(msg, this.getX() + 35, this.getY(), 500, 100);
    text(msg, x + 90, y, 490, 90);
    image(p, x, y - 15, w, w);
    image(heartpic, x + 90, y + 75, 20, 18);
    image(commentpic, x + 150, y + 75, 20, 20);
    image(retweetpic, x + 210, y + 73, 20, 25);
    if(mouseX >= x + 90 && mouseX <= x + 110 && mouseY >= y + 75 && mouseY <= y + 93 && mousePressed){
      image(heartfilledpic, x + 90, y + 75, 20, 18);
      println("check");
    }
  }
  
}
