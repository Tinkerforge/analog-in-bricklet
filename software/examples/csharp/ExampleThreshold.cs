using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "XYZ"; // Change to your UID

	// Callback function for voltage smaller than 5 V (parameter has unit mV)
	static void VoltageReachedCB(BrickletAnalogIn sender, int voltage)
	{
		System.Console.WriteLine("Voltage: " + voltage/1000.0 + " V");
	}

	static void Main()
	{
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletAnalogIn ai = new BrickletAnalogIn(UID, ipcon); // Create device object

		ipcon.Connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Get threshold callbacks with a debounce time of 10 seconds (10000ms)
		ai.SetDebouncePeriod(10000);

		// Register threshold reached callback to function VoltageReachedCB
		ai.VoltageReached += VoltageReachedCB;

		// Configure threshold for "smaller than 5 V" (unit is mV)
		ai.SetVoltageCallbackThreshold('<', 5*1000, 0);

		System.Console.WriteLine("Press enter to exit");
		System.Console.ReadLine();
		ipcon.Disconnect();
	}
}
