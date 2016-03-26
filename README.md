# punkapi [![Build Status](https://travis-ci.org/samjbmason/punkapi-ruby.svg?branch=master)](https://travis-ci.org/samjbmason/punkapi-ruby)

A ruby wrapper for the PunkAPI, an API that takes Brewdog's DIY Dog and makes it into a JSON API. Read more about it [here](https://github.com/samjbmason/punkapi)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'punkapi', '~> 1.0.0'
```

Or install it yourself as:

```
$ gem install punkapi-ruby
```

## Usage

### Initialize

```ruby
client = PunkAPI::Client.new(API_KEY)
```

### Get a Beer
```ruby
client.beer(2)

=> #<PunkAPI::Entity id=2, name="Trashy Blonde", tagline="You Know You Shouldn't", first_brewed="April 2008", ...
```

### Get a random Beer
```ruby
client.random_beer

=> #<PunkAPI::Entity id=138, name="Dog A", tagline="Cacao, Coffee, Chili Imperial Anniversary Stout.", first_brewed="May 2012", ...
```

### Get Beers
This will return an array of `PunkAPI::Entity` objects in chronological order from `first_brewed` date. You can also pass any of the query paramters from the docs as an argument.

```ruby
client.beers(beer_name: 'Dog A')

=> [#<PunkAPI::Entity id=138, name="Dog A", tagline="Cacao, Coffee, Chili Imperial Anniversary Stout.", first_brewed="May 2012", ...]
```

### Accessing data
You can access the attributes using the ruby dot notation

```ruby
beers = client.beers(beer_name: 'Dog A')

beers.first.name

=> "Dog A"
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/samjbmason/punkapi-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
