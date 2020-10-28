class Message
  def initialize(json, city)
    @json = json
    @city = city
  end

  def create_message
    current_date = convert_date(@json['current']['dt'])
    current_temp = @json['current']['temp']
    current_weather = @json['current']['weather'].first['description']

    debugger
    "#{current_temp}°C e #{current_weather} em #{@city} em #{current_date}. Média para os próximos dias: "
  end

  def second_message
    daily = @json['daily']
    debugger

    daily.each do |daily|
      temp = daily['temp']['day']
      date = convert_date(daily['dt'])
      message << "#{temp}°C em #{date}"
    end
  end

  def convert_date(date)
    DateTime.strptime(date,'%s').strftime('%d/%m')
  end
end
