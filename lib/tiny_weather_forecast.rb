require "tiny_weather_forecast/version"
require 'json'

module TinyWeatherForecast
  def forecast(authentication_token, city)
    resp = RestClient.get "#{base_url}lat=#{lat}&lon=#{lon}&appid=#{authentication_token}"
    puts JSON.parse(resp.body)
  end

  private

  def base_url
    'https://api.openweathermap.org/data/2.5/onecall?'
  end

  def location
    Geocoder.search(@city).first.coordinates
  end

  def lat
    location.first
  end

  def lon
    location.last
  end
end
