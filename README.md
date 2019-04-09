# iCasei: Back-end test
This project contains two Rails apps: the main app which tracks access and contacts from clients websites, and an example website which simulates a client website containg a JS file to send tracking info to the main app.

The JS file which tracks visits is located in `example-website/app/assets/javascripts/access-tracker.js`.
## Dependencies

1. Ruby 2.6.2
2. Rails 5.2.3
3. PostgreSQL 10.6

## Instructions to install

_Be sure to have the required version of Ruby, Rails and PostgreSQL._

1. Clone the repository:
```
  $ git clone git@github.com:bcrivelaro/teste-back-end.git
```
2. Open the clone folder:
```
  $ cd teste-back-end/
```
3. Open the example-website app folder:
```
  $ cd example-website/
```
4. Install all gem dependencies:
```
  $ bundle install
```
5. Go back to project root:
```
  $ cd ..
```
6. Open the tracker app folder:
```
  $ cd tracker/
```
7. Copy the .env example file:
```
  $ cp .env.example .env
```
8. Change .env values according to your PosgreSQL credentials.

9. Install all gem dependencies:
```
  $ bundle install
```
10. Create the database:
```
  $ bundle exec rake db:create
```
11. Run the migrations:
```
  $ bundle exec rake db:migrate
```

## Running

1. Open the tracker app folder:
```
  $ cd tracker/
```
2. Run the tracker app on port 3000:
```
  $ bundle exec rails s -p 3000
```
3. Go back to project root:
```
  $ cd ..
```
4. Open the example-website app folder:
```
  $ cd example-website/
```
5. Run the example-website app on port 3001:
```
  $ bundle exec rails s -p 3001
```

## Tests

_Only the tracker app has tests._

1. Enter the tracker app folder:
```
  $ cd tracker/
```
2. Run tests:
```
  $ bundle exec rspec spec/
```