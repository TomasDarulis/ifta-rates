Ruby version: 2.7.7

Rails version: 6.1.7

Setup:

bundle install

rails db:setup

To run the app:

rails s

./bin/webpacker-dev-server

To run a rake task that fetches ifta rates by year and quarter run this:
rake fetch_ifta_rates\[2017,2\]

Visit localhost:3000/ifta_rates to see the data.
