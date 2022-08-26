require 'yahoo_weatherman'
def weather(zip_code)
    client = Weatherman::Client.new
    client.lookup_by_location(zip_code).condition['temp']
end