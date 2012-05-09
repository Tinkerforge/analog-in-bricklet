<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletAnalogIn.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletAnalogIn;

$host = 'localhost';
$port = 4223;
$uid = '7oj'; // Change to your UID

// Callback for voltage smaller than 5V
function cb_reached($voltage)
{
    echo "Voltage dropped below 5V: " . $voltage / 1000.0 . "\n";
}

$ipcon = new IPConnection($host, $port); // Create IP connection to brickd
$ai = new BrickletAnalogIn($uid); // Create device object

$ipcon->addDevice($ai); // Add device to IP connection
// Don't use device before it is added to a connection

// Get threshold callbacks with a debounce time of 10 seconds (10000ms)
$ai->setDebouncePeriod(10000);

// Register threshold reached callback to function cb_reached
$ai->registerCallback(BrickletAnalogIn::CALLBACK_VOLTAGE_REACHED, 'cb_reached');

// Configure threshold for "smaller than 5V" (unit is mV)
$ai->setVoltageCallbackThreshold('<', 5*1000, 0);

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
