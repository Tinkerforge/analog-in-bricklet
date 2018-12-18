package main

import (
	"fmt"
	"github.com/tinkerforge/go-api-bindings/analog_in_bricklet"
	"github.com/tinkerforge/go-api-bindings/ipconnection"
)

const ADDR string = "localhost:4223"
const UID string = "XYZ" // Change XYZ to the UID of your Analog In Bricklet.

func main() {
	ipcon := ipconnection.New()
	defer ipcon.Close()
	ai, _ := analog_in_bricklet.New(UID, &ipcon) // Create device object.

	ipcon.Connect(ADDR) // Connect to brickd.
	defer ipcon.Disconnect()
	// Don't use device before ipcon is connected.

	ai.RegisterVoltageCallback(func(voltage uint16) {
		fmt.Printf("Voltage: %f V\n", float64(voltage)/1000.0)
	})

	// Set period for voltage receiver to 1s (1000ms).
	// Note: The voltage callback is only called every second
	//       if the voltage has changed since the last call!
	ai.SetVoltageCallbackPeriod(1000)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()

}
