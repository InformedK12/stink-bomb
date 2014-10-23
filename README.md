# StinkBomb

[![Gem Version](https://badge.fury.io/rb/stink-bomb.svg)](http://badge.fury.io/rb/stink-bomb)
[![Build Status](https://travis-ci.org/ChalkSchools/stink-bomb.svg?branch=master)](https://travis-ci.org/ChalkSchools/stink-bomb)
[![Coverage Status](https://img.shields.io/coveralls/ChalkSchools/stink-bomb.svg)](https://coveralls.io/r/ChalkSchools/stink-bomb?branch=master)

Create a `StinkBomb` that will throw an error if your code is out of date.
Useful for when you have code that should be addressed in the near future,
and you want this code to fail CI when it gets too stinky.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stink-bomb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stink-bomb

## Usage

```ruby
StinkBomb.create('January 20, 2001')
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/stink-bomb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
