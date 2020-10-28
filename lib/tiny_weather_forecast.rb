require "tiny_weather_forecast/version"
require 'json'
require 'rest-client'
require 'geocoder'
require 'byebug'
require 'dotenv/load'


module TinyWeatherForecast
  class Forecast
    def initialize(city)
      @city = city
      @appid = ENV['OPEN_WEATHER_FORECAST_KEY']
    end

    def forecast
      resp = RestClient.get complete_url
      json = JSON.parse(resp.body)

      message = create_message(json)
    end

    def create_message(json)
      current = json['daily'].first
      current_date = convert_date(current['dt'])
      current_temp = (current['temp']['min'] + current['temp']['max'] / 2).to_i
      current_weather = current['weather'].first['description']

      "#{current_temp}°C e #{current_weather} em #{@city} em #{current_date}. Média para os próximos dias: " + second_message(json)
    end

    def second_message(json)
      daily = json['daily']
      message = ''
      cont = 0

      daily.first(6).each do |daily|
        next if cont == 0
        debugger
        temp = (current['temp']['min'] + current['temp']['max'] / 2).to_i
        date = convert_date(daily['dt'])
        message += "#{temp}°C em #{date}"
        cont == 5 ? message += '.' : message += ', '
        cont += 1
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
