void updateCharacter(){
  
  //key control
  if (rightkey == false) {
    currentAction = idle;
    dx = 0;
  }
  if (downkey == false) {
    currentAction = idle;
    character.setRotation(0);
    dx = 0;
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
    dx += 100;
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
}