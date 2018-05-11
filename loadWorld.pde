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
  
  //wall left
  FBox wall = new FBox(200, height);
  wall.setPosition(-105, 350);
  wall.setFillColor(darkblue);
  wall.setStrokeColor(darkblue);
  wall.setGrabbable(false);
  wall.setStatic(true);
  world.add(wall);
  
  //generator platform
  FPoly generator = new FPoly();
  generator.vertex(-105, 100);
  generator.vertex(-5, 100);
  generator.vertex(-105, 0);
  generator.setFillColor(darkblue);
  generator.setStrokeColor(darkblue);
  generator.setGrabbable(false);
  generator.setStatic(true);
  world.add(generator);
  
  //wall right
  FBox wall2 = new FBox(200, height);
  wall2.setPosition(width + 105, 40);
  wall2.setFillColor(darkblue);
  wall2.setStrokeColor(darkblue);
  wall2.setGrabbable(false);
  wall2.setStatic(true);
  world.add(wall2);

  //box left side
  FBox bleft = new FBox(10, 85);
  bleft.setPosition(width - 120, height - 142);
  bleft.setFillColor(brown);
  bleft.setStrokeColor(brown);
  bleft.setGrabbable(false);
  bleft.setStatic(true);
  bleft.setName("boxleft");
  world.add(bleft);
  
  //box right side
  bright = new FBox(10, 85);
  bright.setPosition(width - 10, height - 142);
  bright.setFillColor(brown);
  bright.setStrokeColor(brown);
  bright.setGrabbable(false);
  bright.setStatic(true);
  bright.setName("boxright");
  world.add(bright);
  
  FBox bdown = new FBox(115, 10);
  bdown.setPosition(width - 65, height - 105);
  bdown.setFillColor(brown);
  bdown.setStrokeColor(brown);
  bdown.setGrabbable(false);
  bdown.setStatic(true);
  bdown.setName("bottom");
  world.add(bdown);
  
  FPoly bdown2 = new FPoly();
  bdown2.vertex(width - 120, height - 155);
  bdown2.vertex(width - 120, height - 110);
  bdown2.vertex(width - 10, height - 110);
  bdown2.setFillColor(brown);
  bdown2.setStrokeColor(brown);
  bdown2.setGrabbable(false);
  bdown2.setStatic(true);
  bdown2.setName("slope");
  world.add(bdown2);
}
