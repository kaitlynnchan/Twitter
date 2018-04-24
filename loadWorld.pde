void loadWorld() {
  world = new FWorld();

  //twitter bird
  character = new FBox(gridSize, gridSize);
  character.setPosition(50, 50);
  character.setStatic(false);
  world.add(character);

  //platform
  FBox ground = new FBox(width *2, 100);
  ground.setPosition(width/2, height - 50);
  ground.setFillColor(darkblue);
  ground.setStrokeColor(darkblue);
  ground.setStatic(true);
  world.add(ground);
}