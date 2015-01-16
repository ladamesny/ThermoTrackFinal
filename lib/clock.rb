require 'rubygems'
require 'clockwork'
include Clockwork

require './config/boot'
require './config/environment'

every(5.minutes, 'readings.get'){
  Reading.get_readings
}

