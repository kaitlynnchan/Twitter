//Kaitlynn Chan
//2018-04-11
//1-1

import twitter4j.util.*;
import twitter4j.*;
import twitter4j.management.*;
import twitter4j.api.*;
import twitter4j.conf.*;
import twitter4j.json.*;
import twitter4j.auth.*;
import fisica.*;

//fisica
Fisica fisica;
FWorld world;
int gridSize = 40;

//twitter
ConfigurationBuilder cb;
Twitter twitterInstance;
Query queryForTwitter;
String text;
String[] blinkingtext = {
  " ", "_", 
};
int blinktext = 0;

float x = 35, y = 35;
float dx;

FBox bright;
FBox character;
ArrayList<FTweet> tweets;
ArrayList<FTweetBox> tweetbox;

PImage[] birdleft;
PImage[] birdright;
PImage[] idle;
PImage[] currentAction;
int costumeNum = 0;
PImage backarrow, heartpic, heartfilledpic, commentpic, retweetpic;

boolean upkey, leftkey, rightkey, downkey, controlkey;

color blue = #9AE4E8;
color darkblue = #066591;
color white = #FFFFFF;
color aqua = #1BB5AD;
color brown = #BC8554;
color black = #000000;

int countdown = 200;
boolean startcountdown = false;

void setup() {
  cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey(""); 
  cb.setOAuthConsumerSecret("");
  cb.setOAuthAccessToken("");
  cb.setOAuthAccessTokenSecret("");

  twitterInstance = new TwitterFactory(cb.build()).getInstance();

  //twitter bird idle costume
  idle = new PImage[1];
  idle[0] = loadImage("twitter-bird-sprite_01.png");
  idle[0].resize(gridSize, gridSize - 7);

  //twitter bird moving right costume
  birdright = new PImage[3];
  birdright[0] = loadImage("twitter-bird-sprite_02.png");
  birdright[0].resize(gridSize + 2, gridSize - 7);
  birdright[1] = loadImage("twitter-bird-sprite_03.png");
  birdright[1].resize(gridSize + 2, gridSize - 7);
  birdright[2] = loadImage("twitter-bird-sprite_04.png");
  birdright[2].resize(gridSize + 2, gridSize - 7);

  //twitter bird moving left costume
  birdleft = new PImage[3];
  birdleft[0] = loadImage("twitter-bird-sprite_06.png");
  birdleft[0].resize(gridSize + 2, gridSize - 7);
  birdleft[1] = loadImage("twitter-bird-sprite_07.png");
  birdleft[1].resize(gridSize + 2, gridSize - 7);
  birdleft[2] = loadImage("twitter-bird-sprite_08.png");
  birdleft[2].resize(gridSize + 2, gridSize - 7);

  currentAction = idle;

  backarrow = loadImage("back arrow.png");
  heartpic = loadImage("heart-pic.png");
  heartfilledpic = loadImage("heart-filled-pic1.png");
  commentpic = loadImage("comment-pic.png");
  retweetpic = loadImage("retweet-pic.png");

  size (600, 500);
  background(blue);
  Fisica.init(this);
  text = "";
  loadWorld();
}

void fetchAndDrawTweets() {
  ArrayList tweets;
  queryForTwitter = new Query(text);
  try {
    QueryResult result = twitterInstance.search(queryForTwitter);
    tweets = (ArrayList) result.getTweets();
    for (int i = 0; i < 5; i++) {
      Status t = (Status) tweets.get(i);
      String user = t.getUser().getName();
      String profilepicURL = t.getUser().getBiggerProfileImageURL();
      float w = t.getUser().getFollowersCount();
      PImage p = loadImage(profilepicURL);
      String msg = t.getText();
      
      tweetbox.add(new FTweetBox(msg, user, p, w));
    }
  } 
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  }
}

void draw() {
  background(blue);
  world.step();
  world.draw();

  fill(white);
  textSize(30);
  text("#", 50, 50);
  text(text + blinkingtext[blinktext], 70, 50);
  
  if (frameCount % 30 == 0) {
    blinktext += 1;
    if (blinktext > 1) {
      blinktext = 0;
    }
  }

  image(backarrow, width - 70, 25, 50, 30);
  
  int n2 = tweetbox.size();
  int i2 = 0;
  while (i2 < n2) {
    FTweetBox c = tweetbox.get(i2);
    c.act();
    i2++;
  }
  
  if (startcountdown == true) {
    countdown--;
    if (countdown < 0) {
      bright.setRotation(0);
      bright.setPosition(width - 10, height - 142);
      countdown = 200;
      startcountdown = false;
    }
  }

  updateCharacter();
  
}

void keyPressed() {
  if (keyCode == UP) upkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == CONTROL) controlkey = true;
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) upkey = false;
    if (keyCode == LEFT) leftkey = false;
    if (keyCode == DOWN) downkey = false;
    if (keyCode == RIGHT) rightkey = false;
    if (keyCode == CONTROL) controlkey = false;
  } else {
    if (key == BACKSPACE) {
      if (text.length() > 0) {
        text = text.substring(0, text.length() - 1);
      }
    } else if (key == RETURN || key == ENTER) {
      fetchAndDrawTweets();
      text = "";
    } else if (key == DELETE) {
      loadWorld();
    } else {
      text += key;
    }
  }
}

void mouseReleased() {
  int n2 = tweetbox.size();
  int i2 = tweetbox.size() - 5;
  println(i2, n2);
  if (mouseX >= width - 70 && mouseX <= width - 20 && mouseY >= 25 && mouseY <= 55 && tweetbox.size() > 0) {
    while (i2 < n2) {
      FTweetBox c = tweetbox.get(i2);
      tweetbox.remove(i2);
      world.remove(c);
      n2--;
    }
  }
}

