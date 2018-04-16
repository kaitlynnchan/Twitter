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

ConfigurationBuilder cb;
Twitter twitterInstance;
Query queryForTwitter;

float x = 35, y = 35;

color blue = #9AE4E8;

void setup() {
  cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey(""); 
  cb.setOAuthConsumerSecret("");
  cb.setOAuthAccessToken("");
  cb.setOAuthAccessTokenSecret("");

  twitterInstance = new TwitterFactory(cb.build()).getInstance();
  queryForTwitter = new Query("#");

  //String statusMessage = "watch ou this inte";
  //File file = new File("/image/Done.jpg");
  //StatsUpdate = status = StatusUpdate(message);
  //status.SetMedia(file);
  //twitter.updateStatus(status);

  size (640, 440);
  background(blue);
  fetchAndDrawTweets();
}

void fetchAndDrawTweets() {
  try {
    QueryResult result = twitterInstance.search(queryForTwitter);
    ArrayList tweets = (ArrayList) result.getTweets();
    for (int i = 0; i < tweets.size(); i++) {
      Status t = (Status) tweets.get(i);
      String user = t.getUser().getName();
      String profilepicURL = t.getUser().getBiggerProfileImageURL();
      float w = t.getUser().getFollowersCount();
      PImage p = loadImage(profilepicURL);
      image(p, x, y, w/25, w/25);
      x += 100;
      if (x + 70 >= width) {
        y += 100;
        x = 35;
      }
      
      println(x, y);

      String msg = t.getText();
      println(user + ": " + msg);
      println("--------------------------------------------------------------------------------------------------------------------------------");
    }
  } 
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  }
}

//void mouseReleased() {
//  if (mouseX >= x && mouseX <= x + 70 && mouseY >= y && mouseY <= y + 70) {
//    textSize(28);
//    fill(255);
//    text(msg, width/2, height/2);
//    println("check");
//  }
//}
