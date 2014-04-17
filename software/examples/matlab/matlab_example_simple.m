function matlab_example_simple
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletAnalogIn;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'abd2'; % Change to your UID

    ipcon = IPConnection(); % Create IP connection
    ai = BrickletAnalogIn(UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current voltage (unit is mV)
    voltage = ai.getVoltage();
    fprintf('Voltage: %g V', voltage/1000.0);

    input('Press any key to exit...\n', 's');
    ipcon.disconnect();
end