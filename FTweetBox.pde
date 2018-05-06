class FTweetBox extends FBox {
  String msg, name;
  PImage p;

  FTweetBox(String _msg, String _name, PImage _p) {
    super(_p.width, _p.height);
    p = _p;
    msg = _msg;
    name = _name;
    this.setAngularVelocity(random(0, 10));
    this.setPosition(random(200, 400), -50);
    this.setName("tweet");
    this.attachImage(p);
    world.add(this);
  }

  void act() {
    if (touching("slope")) {
      int i3 = 0;
      while (i3 < 1) {
        tweets.add(new FTweet(msg, name, p));
        i3++;
      }

      int n = tweets.size();
      int i = 0;
      while (i < n) {
        FTweet c = tweets.get(i);
        //c.act();
        c.show();
        i++;
      }
    }
    if (touching("twitter-bird") && controlkey == true) {
      this.setPosition(character.getX(), character.getY() - 60);
    }
  }

  void removethis() {
    world.remove(this);
  }

  boolean touching(String thing) {
    ArrayList<FContact> contacts = this.getContacts();

    for (FContact c : contacts) {
      if (c.contains("tweet", thing)) {
        return true;
      }
    }
    return false;
  }
}