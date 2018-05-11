class FTweetBox extends FBox {
  String msg, name;
  PImage p;
  int followers;

  FTweetBox(String _msg, String _name, PImage _p, int _followers) {
    super(_p.width, _p.height);
    p = _p;
    msg = _msg;
    name = _name;
    followers = _followers;
    this.setAngularVelocity(0);
    this.setPosition(-50, -50);
    this.setName("tweet");
    this.attachImage(p);
    world.add(this);
  }

  void act() {
    if (touching("slope")) {
      if(frameCount % 20 == 0){
        tweets.add(new FTweet(msg, name, p, followers));
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
