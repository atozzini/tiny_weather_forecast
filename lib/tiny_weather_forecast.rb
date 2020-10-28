require "tiny_weather_forecast/version"
require 'json'
require 'rest-client'
require 'geocoder'
require 'byebug'
require 'dotenv/load'
require 'active_support/core_ext'


module TinyWeatherForecast
  class Forecast
    def initialize(city)
      @city = city
      @appid = ENV['OPEN_WEATHER_FORECAST_KEY']
    end

    def forecast
      resp = RestClient.get complete_url
      json = JSON.parse(resp.body)

      message = create_message(json['daily'])
    end

    def create_message(json)
      current = json.first
      current_date = convert_date(current['dt'])
      current_temp = (current['temp']['min'] + current['temp']['max'] / 2).to_i
      current_weather = current['weather'].first['description']

      "#{current_temp}°C e #{current_weather} em #{@city.titleize} em #{current_date}. Média para os próximos dias: " + second_message(json)
    end

    def second_message(json)
      message = ''
      cont = 0

      json.first(6).each do |json|
        cont += 1
        next if cont == 1

        temp = (json['temp']['min'] + json['temp']['max'] / 2).to_i
        date = convert_date(json['dt'])
        message += "#{temp}°C em #{date}"
        cont == 6 ? message += '.' : message += ', '
      end

      message
    end

    private

    def convert_date(date)
      DateTime.strptime(date.to_s,'%s').strftime('%d/%m')
    end

    def complete_url
      "#{base_url}lat=#{lat}&lon=#{lon}&appid=#{@appid}#{language}#{unit}"
    end

    def language
      '&lang=pt_br'
    end

    def unit
      '&units=metric'
    end

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
end
