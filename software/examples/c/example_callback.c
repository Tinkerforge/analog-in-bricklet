
#include <stdio.h>

#include "ip_connection.h"
#include "bricklet_analog_in.h"

#define HOST "localhost"
#define PORT 4223
#define UID "ABC" // Change to your UID

// Callback function for voltage callback (parameter has unit mV)
void cb_voltage(uint16_t voltage) {
	printf("Voltage: %f V\n", voltage/1000.0);
}

int main() {
	// Create IP connection to brickd
	IPConnection ipcon;
	if(ipcon_create(&ipcon, HOST, PORT) < 0) {
		fprintf(stderr, "Could not create connection\n");
		exit(1);
	}

	// Create device object
	AnalogIn ai;
	analog_in_create(&ai, UID); 

	// Add device to IP connection
	if(ipcon_add_device(&ipcon, &ai) < 0) {
		fprintf(stderr, "Could not connect to Bricklet\n");
		exit(1);
	}
	// Don't use device before it is added to a connection

	// Set Period for voltage callback to 1s (1000ms)
	// Note: The callback is only called every second if the 
	//       voltage has changed since the last call!
	analog_in_set_voltage_callback_period(&ai, 1000);

	// Register voltage callback to function cb_voltage
	analog_in_register_callback(&ai, ANALOG_IN_CALLBACK_VOLTAGE, cb_voltage);

	printf("Press ctrl+c to close\n");
	ipcon_join_thread(&ipcon); // Join mainloop of IP connection
}
