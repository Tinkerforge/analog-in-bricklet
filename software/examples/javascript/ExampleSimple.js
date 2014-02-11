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
        // Get current voltage (unit is mV)
        ai.getVoltage(
            function(voltage) {
                console.log('Voltage: '+voltage/1000+' V');
            },
            function(error) {
                console.log('Error: '+error);
            }
        );
    }
);

console.log("Press any key to exit ...");
process.stdin.on('data',
    function(data) {
        ipcon.disconnect();
        process.exit(0);
    }
);

