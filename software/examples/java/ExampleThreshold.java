import com.tinkerforge.BrickletAnalogIn;
import com.tinkerforge.IPConnection;

public class ExampleThreshold {
	private static final String host = new String("localhost");
	private static final int port = 4223;
	private static final String UID = new String("ABC"); // Change to your UID
	
	// Note: To make the example code cleaner we do not handle exceptions. Exceptions you
	//       might normally want to catch are described in the commnents below
	public static void main(String args[]) throws Exception {
		// Create connection to brickd
		IPConnection ipcon = new IPConnection(host, port); // Can throw IOException
		BrickletAnalogIn ai = new BrickletAnalogIn(UID); // Create device object

		// Add device to IP connection
		ipcon.addDevice(ai); // Can throw IPConnection.TimeoutException
		// Don't use device before it is added to a connection

		// Get threshold callbacks with a debounce time of 10 seconds (10000ms)
		ai.setDebouncePeriod(10000);

		// Configure threshold for "smaller than 5V" (unit is mV)
		ai.setVoltageCallbackThreshold('<', (short)(5*1000), (short)0);

		// Add and implement voltage reached listener 
		// (called if voltage is smaller than 5V)
		ai.addListener(new BrickletAnalogIn.VoltageReachedListener() {
			public void voltageReached(int voltage) {
				System.out.println("Voltage dropped below 5V: " + voltage/1000.0);
			}
		});

		System.out.println("Press ctrl+c to exit");
		ipcon.joinThread();
	}
}
