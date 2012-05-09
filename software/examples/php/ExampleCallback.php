<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletAnalogIn.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletAnalogIn;

$host = 'localhost';
$port = 4223;
$uid = '7oj'; // Change to your UID

// Callback function for voltage callback (parameter has unit mV)
function cb_voltage($voltage)
{
    echo "Voltage: " . $voltage / 1000.0 . " V\n";
}

$ipcon = new IPConnection($host, $port); // Create IP connection to brickd
$ai = new BrickletAnalogIn($uid); // Create device object

$ipcon->addDevice($ai); // Add device to IP connection
// Don't use device before it is added to a connection

// Set Period for voltage callback to 1s (1000ms)
// Note: The callback is only called every second if the 
//      voltage has changed since the last call!
$ai->setVoltageCallbackPeriod(1000);

// Register illuminance callback to function cb_illuminance
$ai->registerCallback(BrickletAnalogIn::CALLBACK_VOLTAGE, 'cb_voltage');

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
