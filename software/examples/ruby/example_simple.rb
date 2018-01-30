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

# Get current voltage
voltage = ai.get_voltage
puts "Voltage: #{voltage/1000.0} V"

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
