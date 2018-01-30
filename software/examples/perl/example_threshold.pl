#!/usr/bin/perl

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletAnalogIn;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Analog In Bricklet

# Callback subroutine for voltage reached callback
sub cb_voltage_reached
{
    my ($voltage) = @_;

    print "Voltage: " . $voltage/1000.0 . " V\n";
}

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $ai = Tinkerforge::BrickletAnalogIn->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Get threshold callbacks with a debounce time of 10 seconds (10000ms)
$ai->set_debounce_period(10000);

# Register voltage reached callback to subroutine cb_voltage_reached
$ai->register_callback($ai->CALLBACK_VOLTAGE_REACHED, 'cb_voltage_reached');

# Configure threshold for voltage "smaller than 5 V"
$ai->set_voltage_callback_threshold('<', 5*1000, 0);

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
