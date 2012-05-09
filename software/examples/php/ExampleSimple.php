<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletAnalogIn.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletAnalogIn;

$host = 'localhost';
$port = 4223;
$uid = '7oj'; // Change to your UID

$ipcon = new IPConnection($host, $port); // Create IP connection to brickd
$ai = new BrickletAnalogIn($uid); // Create device object

$ipcon->addDevice($ai); // Add device to IP connection
// Don't use device before it is added to a connection

// Get current voltage (unit is mV)
$voltage = $ai->getVoltage() / 1000.0;

echo "Voltage: $voltage V\n";

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));
$ipcon->destroy();

?>
