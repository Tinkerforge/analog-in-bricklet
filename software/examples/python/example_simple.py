#!/usr/bin/env python
# -*- coding: utf-8 -*-  

HOST = "localhost"
PORT = 4223
UID = "ABC" # Change to your UID

from tinkerforge.ip_connection import IPConnection
from tinkerforge.bricklet_analog_in import AnalogIn

if __name__ == "__main__":
    ipcon = IPConnection(HOST, PORT) # Create IP connection to brickd

    ai = AnalogIn(UID) # Create device object
    ipcon.add_device(ai) # Add device to IP connection
    # Don't use device before it is added to a connection

    # Get current voltage (unit is mV)
    voltage = ai.get_voltage()

    print('Voltage: ' + str(voltage/1000.0) + ' V')

    raw_input('Press key to exit\n') # Use input() in Python 3
    ipcon.destroy()
