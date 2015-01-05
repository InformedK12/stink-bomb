# StinkBomb

[![Gem Version](https://badge.fury.io/rb/stink_bomb.svg)](http://badge.fury.io/rb/stink_bomb)
[![Build Status](https://travis-ci.org/ChalkSchools/stink-bomb.svg?branch=master)](https://travis-ci.org/ChalkSchools/stink-bomb)
[![Code Climate](https://codeclimate.com/github/ChalkSchools/stink-bomb/badges/gpa.svg)](https://codeclimate.com/github/ChalkSchools/stink-bomb)
[![Test Coverage](https://codeclimate.com/github/ChalkSchools/stink-bomb/badges/coverage.svg)](https://codeclimate.com/github/ChalkSchools/stink-bomb)

Create a `StinkBomb` that will throw an error if your code is out of date.
Useful for when you have code that should be addressed in the near future,
and you want this code to fail CI when it gets too stinky.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stink_bomb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stink_bomb

## Usage

```ruby
StinkBomb.create('January 20, 2001')
```

## Contributing

1. Fork it ( https://github.com/ChalkSchools/stink-bomb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
