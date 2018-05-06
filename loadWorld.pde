void loadWorld() {
  world = new FWorld();
  tweets = new ArrayList<FTweet>();
  tweetbox = new ArrayList<FTweetBox>();
  
  //twitter bird
  character = new FBox(gridSize, gridSize);
  character.setPosition(50, 50);
  character.setStatic(false);
  character.setName("twitter-bird");
  world.add(character);

  //platform
  FBox ground = new FBox(width *2, 100);
  ground.setPosition(width/2, height - 50);
  ground.setFillColor(darkblue);
  ground.setStrokeColor(darkblue);
  ground.setGrabbable(false);
  ground.setStatic(true);
  world.add(ground);
  
  //box
  FBox bleft = new FBox(10, 80);
  bleft.setPosition(width - 120, height - 150);
  bleft.setFillColor(brown);
  bleft.setStrokeColor(brown);
  bleft.setGrabbable(false);
  bleft.setStatic(true);
  bleft.setName("boxleft");
  world.add(bleft);
  
  FBox bright = new FBox(10, 80);
  bright.setPosition(width - 10, height - 150);
  bright.setFillColor(brown);
  bright.setStrokeColor(brown);
  bright.setGrabbable(false);
  bright.setStatic(true);
  world.add(bright);
  
  FBox bdown = new FBox(120, 10);
  bdown.setPosition(width - 65, height - 105);
  bdown.setFillColor(brown);
  bdown.setStrokeColor(brown);
  bdown.setGrabbable(false);
  bdown.setStatic(true);
  bdown.setName("bottom");
  world.add(bdown);
  
  FPoly bdown2 = new FPoly();
  bdown2.vertex(width - 120, height - 105);
  bdown2.vertex(width - 10, height - 105);
  bdown2.vertex(width - 10, height - 150);//(width - 65, height - 105);
  bdown2.setFillColor(brown);
  bdown2.setStrokeColor(brown);
  bdown2.setGrabbable(false);
  bdown2.setStatic(true);
  bdown2.setName("slope");
  world.add(bdown2);
}
