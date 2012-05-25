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

# Get current voltage (unit is mV)
voltage = ai.get_voltage / 1000.0
puts "Voltage: #{voltage} V"

puts 'Press key to exit'
$stdin.gets
ipcon.destroy
