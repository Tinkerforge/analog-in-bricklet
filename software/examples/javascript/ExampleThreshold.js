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
        // Get threshold callbacks with a debounce time of 10 seconds (10000ms)
        ai.setDebouncePeriod(10000);
        // Configure threshold for "smaller than 5V" (unit is mV)
        ai.setVoltageCallbackThreshold('<', 5*1000, 0);      
    }
);

// Register threshold reached callback
ai.on(BrickletAnalogIn.CALLBACK_VOLTAGE_REACHED,
    // Callback for voltage smaller than 5V
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

