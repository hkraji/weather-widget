require 'net/http'

# you can find CITY_ID here http://bulk.openweathermap.org/sample/city.list.json.gz
# 2643743 - London
# 2950159 - Berlin

CITY_IDS = '2643743,2950159' # no spaces

# options: metric / imperial
UNITS   = 'metric'

# create free account on open weather map to get API key
API_KEY = 'INSERT_KEY_HERE'

SCHEDULER.every '15m', :first_in => 0 do |job|

  http = Net::HTTP.new('api.openweathermap.org')
  response = http.request(Net::HTTP::Get.new("/data/2.5/group?id=#{CITY_IDS}&units=#{UNITS}&appid=#{API_KEY}"))
  
  next unless '200'.eql? response.code
  
  weather_data  = JSON.parse(response.body)
  
  weather_data['list'].each do |location|
        
    detailed_info = location['weather'].first
    current_temp  = location['main']['temp'].to_f.round
    
    send_event("weather-#{location['id']}", { :temp => "#{current_temp} &deg;#{temperature_units}",
                            :condition => detailed_info['main'],
                            :title => "#{location['name']}",
                            :color => color_temperature(current_temp),
                            :climacon => climacon_class(detailed_info['id'])})
  end

end


def temperature_units
  'metric'.eql?(UNITS) ? 'C' : 'K'
end

def color_temperature(temp_celsius)
  case temp_celsius.to_i
  when 30..100
    '#FF3300'
  when 25..29
    '#FF6000'
  when 19..24
    '#FF9D00'
  when 5..18
    '#18A9FF'
  else
    '#0065FF'
  end
end

# fun times ;) legend: http://openweathermap.org/weather-conditions
def climacon_class(weather_code)
  case weather_code.to_s
  when /800/
    'sun'
  when /80./
    'cloud'
  when /2.*/
    'lightning'
  when /3.*/
    'drizzle'
  when /5.*/
    'rain'
  when /6.*/
    'snow'
  else
    'sun'
  end
end