/*

See the profile images of those who have most recently tweeted a hashtag.

You'll need to add the Twitter4J library to your Processing "libraries" folder.

https://github.com/yusuke/twitter4j/

*/

import twitter4j.util.*;
import twitter4j.*;
import twitter4j.management.*;
import twitter4j.api.*;
import twitter4j.conf.*;
import twitter4j.json.*;
import twitter4j.auth.*;

import java.util.*;

Twitter twitter;

String searchString = "#dhsi2015";

List<Status> tweets;

int currentTweet;

String user;


void setup() {
  size(800, 600);
  
  ConfigurationBuilder cb = new ConfigurationBuilder();
  
  cb.setOAuthConsumerKey("");		// Register your App at Twitter, and use them here.
  cb.setOAuthConsumerSecret("");	// Register your App at Twitter, and use them here.
  cb.setOAuthAccessToken("");		// Register your App at Twitter, and use them here.
  cb.setOAuthAccessTokenSecret("");	// Register your App at Twitter, and use them here.
  
  TwitterFactory tf = new TwitterFactory(cb.build());
  
  twitter = tf.getInstance();
  
  getNewTweets();
  
  currentTweet = 0;
  
  thread("refreshTweets");
}

void draw() {
  fill(0, 40);
  rect(0, 0, width, height);
  
  currentTweet = currentTweet + 1;
  
  if (currentTweet >= tweets.size()) {
    currentTweet = 0;
  }
  
  Status status = tweets.get(currentTweet);
  User user = status.getUser();
  String url = user.getProfileImageURL();
  PImage img = loadImage(url);
  
  
  fill(200);
  image(img, random(width-75), random(height-75));
  delay(250);
  
}



