void refreshTweets() {
  while (true){
    getNewTweets();
    println("Updated Tweets");
    delay(30000);
  }
}
