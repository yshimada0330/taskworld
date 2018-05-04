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

### Web Client

```ruby
Taskworld::Client.configure do |config|
  config.server = :usa
  config.email = 'boyd.bankfein@goldmangoose.com'
  config.password = 'm0reM0n1th@nG0D!'
end
```

#### Get all projects
```ruby
client = Taskworld::Client.new
client.project_get_all(space_id: '59eecc4bb0a6a6bc83f5fc39')
```
