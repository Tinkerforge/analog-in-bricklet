#include <stdio.h>

#include "ip_connection.h"
#include "bricklet_analog_in.h"

#define HOST "localhost"
#define PORT 4223
#define UID "ABC" // Change to your UID

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

	// Get current voltage (unit is mV)
	uint16_t voltage;
	if(analog_in_get_voltage(&ai, &voltage) < 0) {
		fprintf(stderr, "Could not get value, probably timeout\n");
		exit(1);
	}

	printf("Voltage: %f V\n", voltage/1000.0);

	printf("Press key to exit\n");
	getchar();
	ipcon_destroy(&ipcon);
}
