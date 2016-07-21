require 'sinatra'
require_relative 'wheel'
require_relative 'gear'

get '/' do
  erb home_page
end

def home_page
  wheel = Wheel.new(55,2)
  gear = Gear.new(20,30,wheel)
  "wheel diameter: #{wheel.diameter}" + '<br>' +
  "wheel circumference: #{wheel.circumference}" + '<br>' +
  "gear ratio: #{gear.ratio}" + '<br>' +
  "gear inches: #{gear.gear_inches}"
end