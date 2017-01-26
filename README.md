# webpagewatcher
Uses the [WebPageTest](http://www.webpagetest.org) API to run web speed tests and stores the data locally


## App Arhitecture

Websites

name | type | description
------------ | -------------
id | integer | Database identiy number
name | string | Name for website
url | string | Full website url http://www.website.com
api_key | string | Default [WebPageTest](http://www.webpagetest.org) api_key for website

Profiles

name | type | description
------------ | ------------- | description
id | integer | Database identiy number
name | string | Name for profile
website_id | integer | Identiy number from website table
wpt_settings | string | [WebPageTest](http://www.webpagetest.org) string defining settings for test
wpt_code | string | [WebPageTest](http://www.webpagetest.org) test code
interval | integer | Time interval to run test
api_key | string | Override Website [WebPageTest](http://www.webpagetest.org) api_key for test

Report

name | type | description
------------ | ------------- | description
id | integer | Database identiy number
wpt_id | string | [WebPageTest](http://www.webpagetest.org) identiy number
status | string | Current test status (running, compelted)
data | string | JSON test results


## Setup

  requires an WebPageTest API key vist [www.webpagetest.org/getkey.php](http://www.webpagetest.org/getkey.php) to get your own key. then add your key to the config file.

  * gem install powder
  * powder link
  * powder open

