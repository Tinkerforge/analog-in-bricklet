using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "ABC"; // Change to your UID

	static void Main() 
	{
		IPConnection ipcon = new IPConnection(HOST, PORT); // Create connection to brickd
		BrickletAnalogIn ai = new BrickletAnalogIn(UID); // Create device object
		ipcon.AddDevice(ai); // Add device to ip connection
		// Don't use device before it is added to a connection


		// Get current voltage (unit is mV)
		ushort voltage;
		ai.GetVoltage(out voltage);

		System.Console.WriteLine("Voltage: " + voltage/1000.0 + " V");

		System.Console.WriteLine("Press ctrl+c to exit");
		ipcon.JoinThread();
    }
}
