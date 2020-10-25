require "tiny_weather_forecast/version"
require 'json'
require 'rest-client'
require 'geocoder'
require 'byebug'


module TinyWeatherForecast
  class Forecast
    def forecast(authentication_token, city)
      resp = RestClient.get "#{base_url}lat=#{lat(city)}&lon=#{lon(city)}&appid=#{authentication_token}"
      puts JSON.parse(resp.body)
    end

    private

    def base_url
      'https://api.openweathermap.org/data/2.5/onecall?'
    end

    def location(city)
      Geocoder.search(city).first.coordinates
    end

    def lat(city)
      location(city).first
    end

    def lon(city)
      location(city).last
    end
  end
end
