function octave_example_simple
    more off;
    
    HOST = "localhost";
    PORT = 4223;
    UID = "abd2"; % Change to your UID

    ipcon = java_new("com.tinkerforge.IPConnection"); % Create IP connection
    ai = java_new("com.tinkerforge.BrickletAnalogIn", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current voltage (unit is mV)
    voltage = ai.getVoltage()/1000;

    fprintf('Voltage: %g V\n', voltage);

    input("\nPress any key to exit...\n", "s");
    ipcon.disconnect();
end
