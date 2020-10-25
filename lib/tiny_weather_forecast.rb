require "tiny_weather_forecast/version"
require 'json'

module TinyWeatherForecast
  attr_reader :authentication_token, :base_url

  def initialize(authentication_token, city, country)
    @authentication_token = authentication_token
    @city = city
    @base_url = 'https://api.openweathermap.org/data/2.5/onecall?'
  end

  def forecast
    resp = RestClient.get "#{@base_url}lat=#{lat}&lon=#{lon}&appid=#{@authentication_token}"
    puts JSON.parse(resp.body)
  end

  private

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
