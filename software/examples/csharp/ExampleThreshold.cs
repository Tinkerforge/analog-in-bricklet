using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "ABC"; // Change to your UID

	// Callback for voltage smaller than 5V
	static void ReachedCB(ushort voltage)
	{
		System.Console.WriteLine("Voltage dopped below 5V: " + voltage/1000.0 + "V");
	}

	static void Main() 
	{
		IPConnection ipcon = new IPConnection(HOST, PORT); // Create connection to brickd
		BrickletAnalogIn ai = new BrickletAnalogIn(UID); // Create device object
		ipcon.AddDevice(ai); // Add device to ip connection
		// Don't use device before it is added to a connection


		// Get threshold callbacks with a debounce time of 1 seconds (1000ms)
		ai.SetDebouncePeriod(1000);

		// Register threshold reached callback to function ReachedCB
		ai.RegisterCallback(new BrickletAnalogIn.VoltageReached(ReachedCB));

		// Configure threshold for "smaller than 5V" (unit is mV)
		ai.SetVoltageCallbackThreshold('<', 5*1000, 0);

		System.Console.WriteLine("Press ctrl+c to exit");
		ipcon.JoinThread();
    }
}
