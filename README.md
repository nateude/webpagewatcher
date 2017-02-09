# webpagewatcher
Uses the [WebPageTest](http://www.webpagetest.org) API to run web speed tests and stores the data locally


## Setup
  1. API KEY
    * Generate a WebPageTest.org [www.webpagetest.org/getkey.php](API KEY)
    * Create config/secrets.yml `bundle exec rake secret`
    * add personal api key [enviroment].webpagetest_key

  2. Enviroment setup
    * gem install powder
    * powder link
    * powder open

