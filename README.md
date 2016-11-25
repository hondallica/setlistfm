# Setlistfm

setlist.fm API client for Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'setlistfm'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install setlistfm

## Usage

```ruby
require "setlistfm"

setlistfm = Setlistfm.new
res = setlistfm.artist "65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab"

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hondallica/setlistfm.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

