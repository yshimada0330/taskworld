# Taskworld

A Ruby client for the Taskworld [Web](https://api.taskworld.com/) APIs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'taskworld'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install taskworld

## Usage

### Use the Authenticate

```ruby
Taskworld.configure do |config|
  config.server = 'Asia'
end
```

### Web Client

#### Get all projects
```ruby
client = Taskworld::Web::Client.new(access_token: access_token)
client.project_get_all
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yshimada0330/taskworld. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
