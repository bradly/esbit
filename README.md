# Esbit

A lightweight gem to interact with the Campfire API that doesn't depend on EventMachine or a Twitter gem.

## Installation

Add this line to your application's Gemfile:

    gem 'esbit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install esbit

## Usage

```ruby
require 'esbit'
campfire = Esbit::Campfire.new('your_campfire_subdomain', 'your_campfire_token')
campfire.rooms
room = campfire.rooms.find_room_by_name('My Room')
room.say 'Hello, World!'
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
