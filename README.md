# WebPageWatcher

WebPageWatcher is designed to use the [WebPageTest](http://www.webpagetest.org) API to run web speed tests and stores the data locally, to allow for tracking speed changes.

## ENV Vars

### WebPageTest API Key
Generate a WebPageTest.org [www.webpagetest.org/getkey.php](API KEY) into order to interacte with the API.

`export WPT_API_KEY='xxxxxxx'`

## Requirements
  - brew (optional)
  - git
  - ruby 2.6.2
  - Postgres 10
  - redis (optional)

## Setup

Clone the repo locally

Install required dependencies
```
cd webpagewatcher
cat .ruby-version | rbenv install
gem install bundler
rbenv rehash
bundle install
```

Install [Puma-Dev](https://github.com/puma/puma-dev) (optional)

```
brew install puma/puma/puma-dev
sudo puma-dev -setup
puma-dev -install
rbenv rehash
puma-dev link
```

Install postgresql 10
```
brew install postgresql@10
brew services start postgresql@10
```

Create your database
```
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

Fire it up!
```
bundle exec rails s
```
or visit `http://WebPageWatcher.test/`
