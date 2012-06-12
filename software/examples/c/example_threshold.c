
#include <stdio.h>

#include "ip_connection.h"
#include "bricklet_analog_in.h"

#define HOST "localhost"
#define PORT 4223
#define UID "ABC" // Change to your UID

// Callback for voltage smaller than 5V
void cb_reached(uint16_t voltage) {
	printf("Voltage dropped below 5V: %f\n", voltage/1000.0);
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

	// Get threshold callbacks with a debounce time of 10 seconds (10000ms)
	analog_in_set_debounce_period(&ai, 10000);

	// Register threshold reached callback to function cb_reached
	analog_in_register_callback(&ai, ANALOG_IN_CALLBACK_VOLTAGE_REACHED, cb_reached);

	// Configure threshold for "smaller than 5V" (unit is mV)
	analog_in_set_voltage_callback_threshold(&ai, '<', 5*1000, 0);

	printf("Press key to exit\n");
	getchar();
	ipcon_destroy(&ipcon);
}
