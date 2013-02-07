#!/usr/bin/env python
# -*- coding: utf-8 -*-  

HOST = "localhost"
PORT = 4223
UID = "ABC" # Change to your UID

from tinkerforge.ip_connection import IPConnection
from tinkerforge.bricklet_analog_in import AnalogIn

# Callback for voltage smaller than 5V
def cb_reached(voltage):
    print('Voltage dropped below 5V: ' + str(voltage/1000.0))

if __name__ == "__main__":
    ipcon = IPConnection() # Create IP connection
    ai = AnalogIn(UID, ipcon) # Create device object

    ipcon.connect(HOST, PORT) # Connect to brickd
    # Don't use device before ipcon is connected

    # Get threshold callbacks with a debounce time of 10 seconds (10000ms)
    ai.set_debounce_period(10000)

    # Register threshold reached callback to function cb_reached
    ai.register_callback(ai.CALLBACK_VOLTAGE_REACHED, cb_reached)

    # Configure threshold for "smaller than 5V" (unit is mV)
    ai.set_voltage_callback_threshold('<', 5*1000, 0)

    raw_input('Press key to exit\n') # Use input() in Python 3
    ipcon.disconnect()
