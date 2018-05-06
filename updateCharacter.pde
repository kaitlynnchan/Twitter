void updateCharacter(){
  
  //key control
  if (rightkey == false) {
    currentAction = idle;
    dx = 0;
  }
  if (downkey == false) {
    currentAction = idle;
    character.setRotation(0);
  }
  if (leftkey == false) {
    currentAction = idle;
    dx = 0;
  }
  if (upkey == false) currentAction = idle;

  if (rightkey == true) {
    currentAction = birdright;
    dx += 100;
  }
  if (leftkey == true) {
    currentAction = birdleft;
    dx -= 100;
  }
  if (upkey == true) {
    currentAction = birdright;
    character.setVelocity(character.getVelocityX(), -100);
  }
  if (downkey == true) {
    currentAction = idle;
    character.setRotation(89);
    character.setVelocity(character.getVelocityX(), 100);
  }
  if (upkey == true && leftkey == true) currentAction = birdleft;
  if (downkey == true && leftkey == true){
    currentAction = birdleft;
    character.setRotation(181);
  }
  if (downkey == true && rightkey == true){
    currentAction = birdright;
    character.setRotation(89);
  }

  character.setVelocity(dx, character.getVelocityY());
  if (costumeNum >= currentAction.length - 1) {
    costumeNum = 0;
  }
  character.attachImage(currentAction[costumeNum]);
  if (frameCount % 20 == 0) {
    costumeNum++;
  }
  
  ArrayList<FContact> contacts;
  contacts = character.getContacts();
  for (FContact c : contacts) {

    if (c.contains("boxleft")) {
      FBody a = c.getBody1();
      FBody b = c.getBody2();
      if (a == character) {
        b.setRotation(-99);
        b.setPosition(width - 160, height - 103);
        countdown--;
        int n = tweets.size();
        int i = 0;
        while (i < n) {
          FTweet c2 = tweets.get(i);
          world.remove(c2);
          i++;
        }
        if (countdown <= 0) {
          b.setRotation(0);
          b.setPosition(width - 120, height - 150);
          countdown = 10;
        }
      } else {
      }
    }
  }
}
