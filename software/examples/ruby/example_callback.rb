#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_analog_in'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = '7oj' # Change to your UID

ipcon = IPConnection.new HOST, PORT # Create IP connection to brickd
ai = BrickletAnalogIn.new UID # Create device object
ipcon.add_device ai # Add device to IP connection
# Don't use device before it is added to a connection

# Set Period for voltage callback to 1s (1000ms)
# Note: The callback is only called every second if the 
#       voltage has changed since the last call!
ai.set_voltage_callback_period 1000

# Register illuminance callback (parameter has unit mV)
ai.register_callback(BrickletAnalogIn::CALLBACK_VOLTAGE) do |voltage|
  puts "Voltage: #{voltage/1000.0} V"
end

puts 'Press key to exit'
$stdin.gets
ipcon.destroy