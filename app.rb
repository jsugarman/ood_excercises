require 'sinatra'

get '/' do
  wheel = Wheel.new(55,2)
  gear = Gear.new(20,30,wheel)
  "wheel diameter: #{wheel.diameter}" +
  "wheel circumference: #{wheel.circumference}" +
  "gear ratio: #{gear.ratio}"
  "gear inches: #{gear.gear_inches}"
end