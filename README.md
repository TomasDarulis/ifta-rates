Ruby version:

```
2.7.7
```

Rails version:
```
6.1.7
```

Node version:
```
v19.4.0
```

Setup:
```
bundle install

yarn install

rails db:setup
```
To run the app:
```
rails s

./bin/webpacker-dev-server
```
To run a rake task that fetches ifta rates by year and quarter:
```
rake fetch_ifta_rates\[2017,2\]
```

Visit localhost:3000/ifta_rates to see the data.
