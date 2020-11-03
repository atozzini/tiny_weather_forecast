# TinyWeatherForecast

This Gem should be used to obtain the weather forecast for a city, from the current date and for the next five consecutive days.

Gem will return a message as shown below:
`25°C e chuva moderada em Itapira em 03/11. Média para os próximos dias: 26°C em 04/11, 27°C em 05/11, 27°C em 06/11, 29°C em 07/11, 36°C em 08/11.`

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tiny_weather_forecast'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tiny_weather_forecast

## Usage

To use in your project, you can do the following thing


`TinyWeatherForecast::Forecast.new(city, appid, geocoder_key).forecast`

**Parameters**

<table>
  <tr>
    <th>Parameter</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><code>city</code></td>
    <td><code>string</code></td>
    <td>Specify the city to get weather forecast</td>
  </tr>
  <tr>
    <td><code>appid</code></td>
    <td><code>string</code></td>
    <td>Pass your OpenWeatherForecast key</td>
  </tr>
  <tr>
    <td><code>geocoder_key</code></td>
    <td><code>string</code></td>
    <td>Pass your Geocoder key fro Geocoder of Google</td>
  </tr>
</table>

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/atozzini/tiny_weather_forecast.
