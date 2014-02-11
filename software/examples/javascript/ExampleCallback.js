var IPConnection = require('Tinkerforge/IPConnection');
var BrickletAnalogIn = require('Tinkerforge/BrickletAnalogIn');

var HOST = 'localhost';
var PORT = 4223;
var UID = 'abd2';// Change to your UID

var ipcon = new IPConnection();// Create IP connection
var ai = new BrickletAnalogIn(UID, ipcon);// Create device object

ipcon.connect(HOST, PORT,
    function(error) {
        console.log('Error: '+error);        
    }
);// Connect to brickd

// Don't use device before ipcon is connected
ipcon.on(IPConnection.CALLBACK_CONNECTED,
    function(connectReason) {
        // Set Period for voltage callback to 1s (1000ms)
        // Note: The callback is only called every second if the 
        // voltage has changed since the last call!
        ai.setVoltageCallbackPeriod(1000); 
    }
);

// Register voltage callback
ai.on(BrickletAnalogIn.CALLBACK_VOLTAGE,
    // Callback function for voltage callback (parameter has unit mV)
    function(voltage) {
        console.log('Voltage: '+voltage/1000+' V');
    }
);

console.log("Press any key to exit ...");
process.stdin.on('data',
    function(data) {
        ipcon.disconnect();
        process.exit(0);
    }
);

