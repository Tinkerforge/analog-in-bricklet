using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "ABC"; // Change to your UID

	// Callback function for voltage callback (parameter has unit mV)
	static void VoltageCB(ushort voltage)
	{
		System.Console.WriteLine("Voltage: " + voltage/1000.0 + " V");
	}

	static void Main() 
	{
		IPConnection ipcon = new IPConnection(HOST, PORT); // Create connection to brickd
		BrickletAnalogIn ai = new BrickletAnalogIn(UID); // Create device object
		ipcon.AddDevice(ai); // Add device to IP connection
		// Don't use device before it is added to a connection

		// Set Period for voltage callback to 1s (1000ms)
		// Note: The voltage callback is only called every second if the 
		//       voltage has changed since the last call!
		ai.SetVoltageCallbackPeriod(1000);

		// Register voltage callback to function VoltageCB
		ai.RegisterCallback(new BrickletAnalogIn.Voltage(VoltageCB));

		System.Console.WriteLine("Press key to exit");
		System.Console.ReadKey();
		ipcon.Destroy();
	}
}
