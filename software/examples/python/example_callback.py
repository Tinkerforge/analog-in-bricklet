#!/usr/bin/env python
# -*- coding: utf-8 -*-  

HOST = "localhost"
PORT = 4223
UID = "ABC" # Change to your UID

from tinkerforge.ip_connection import IPConnection
from tinkerforge.bricklet_analog_in import AnalogIn

# Callback function for voltage callback (parameter has unit mV)
def cb_voltage(voltage):
    print('Voltage: ' + str(voltage/1000.0) + ' V')

if __name__ == "__main__":
    ipcon = IPConnection(HOST, PORT) # Create ip connection to brickd

    ai = AnalogIn(UID) # Create device object
    ipcon.add_device(ai) # Add device to ip connection
    # Don't use device before it is added to a connection

    # Set Period for voltage callback to 1s (1000ms)
    # Note: The callback is only called every second if the 
    #       voltage has changed since the last call!
    ai.set_voltage_callback_period(1000)

    # Register voltage callback to function cb_voltage
    ai.register_callback(ai.CALLBACK_VOLTAGE, cb_voltage)

    raw_input('Press key to exit\n') # Use input() in Python 3
    ipcon.destroy()
