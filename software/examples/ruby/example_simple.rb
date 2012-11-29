#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_analog_in'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = '7oj' # Change to your UID

ipcon = IPConnection.new # Create IP connection
ai = BrickletAnalogIn.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# Get current voltage (unit is mV)
voltage = ai.get_voltage / 1000.0
puts "Voltage: #{voltage} V"

puts 'Press key to exit'
$stdin.gets
