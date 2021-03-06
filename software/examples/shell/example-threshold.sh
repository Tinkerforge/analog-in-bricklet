#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Analog In Bricklet

# Get threshold callbacks with a debounce time of 10 seconds (10000ms)
tinkerforge call analog-in-bricklet $uid set-debounce-period 10000

# Handle incoming voltage reached callbacks
tinkerforge dispatch analog-in-bricklet $uid voltage-reached &

# Configure threshold for voltage "smaller than 5 V"
tinkerforge call analog-in-bricklet $uid set-voltage-callback-threshold threshold-option-smaller 5000 0

echo "Press key to exit"; read dummy

kill -- -$$ # Stop callback dispatch in background
