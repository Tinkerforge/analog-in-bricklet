#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_analog_in'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'XYZ' # Change XYZ to the UID of your Analog In Bricklet

ipcon = IPConnection.new # Create IP connection
ai = BrickletAnalogIn.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# Register voltage callback (parameter has unit mV)
ai.register_callback(BrickletAnalogIn::CALLBACK_VOLTAGE) do |voltage|
  puts "Voltage: #{voltage/1000.0} V"
end

# Set period for voltage callback to 1s (1000ms)
# Note: The voltage callback is only called every second
#       if the voltage has changed since the last call!
ai.set_voltage_callback_period 1000

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
