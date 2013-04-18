# Libarto::Grape

Librato tracking for [Grape][0], based on code from [this NewRelic
gem][1], using [librato-rack][2]

## Installation

Add this line to your application's Gemfile:

    gem 'grape-librato'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grape-librato

Include it in your Grape API like this

    class TestAPI < Grape::API
      use Librato::Grape::Middleware

      get 'hello' do
        "Hello World"
      end
    end

*Make sure you are also using the librato-rack middleware*

Here's an example `config.ru`

    require 'grape'
    require 'librato-rack'
    require 'grape-librato'

    LIBRATO_CONFIGURATION = Librato::Rack::Configuration.new
    LIBRATO_CONFIGURATION.user           = ENV['LIBRATO_USER']
    LIBRATO_CONFIGURATION.token          = ENV['LIBRATO_TOKEN']
    LIBRATO_CONFIGURATION.source         = ENV['LIBRATO_SOURCE'] || 'localhost'

    class API < Grape::API
      use Librato::Grape::Middleware
      get 'hello' do
        "Hello World"
      end
    end

    use Librato::Rack, config: LIBRATO_CONFIGURATION
    run API

See how to set up the `Librato::Rack` object in the [librato-rack][2]
documentation.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Make a pull request

[0]: https://github.com/intridea/grape
[1]: https://github.com/flyerhzm/newrelic-grape
[2]: https://github.com/librato/librato-rack
