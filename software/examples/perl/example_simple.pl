#!/usr/bin/perl

use strict;
use Tinkerforge::IPConnection;
use Tinkerforge::BrickletAnalogIn;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Analog In Bricklet

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $ai = Tinkerforge::BrickletAnalogIn->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Get current voltage
my $voltage = $ai->get_voltage();
print "Voltage: " . $voltage/1000.0 . " V\n";

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
