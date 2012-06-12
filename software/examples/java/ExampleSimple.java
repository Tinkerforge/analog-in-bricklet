import com.tinkerforge.BrickletAnalogIn;
import com.tinkerforge.IPConnection;

public class ExampleSimple {
	private static final String host = "localhost";
	private static final int port = 4223;
	private static final String UID = "ABC"; // Change to your UID
	
	// Note: To make the example code cleaner we do not handle exceptions. Exceptions you
	//       might normally want to catch are described in the commnents below
	public static void main(String args[]) throws Exception {
		// Create connection to brickd
		IPConnection ipcon = new IPConnection(host, port); // Can throw IOException
		BrickletAnalogIn ai = new BrickletAnalogIn(UID); // Create device object

		// Add device to IP connection
		ipcon.addDevice(ai); // Can throw IPConnection.TimeoutException
		// Don't use device before it is added to a connection

		// Get current voltage (unit is mV)
		int voltage = ai.getVoltage(); // Can throw IPConnection.TimeoutException

		System.out.println("Voltage: " + voltage/1000.0 + " V");

		System.console().readLine("Press key to exit\n");
		ipcon.destroy();
	}
}
