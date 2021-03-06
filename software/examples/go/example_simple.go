package main

import (
	"fmt"
	"github.com/Tinkerforge/go-api-bindings/analog_in_bricklet"
	"github.com/Tinkerforge/go-api-bindings/ipconnection"
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

	// Get current voltage.
	voltage, _ := ai.GetVoltage()
	fmt.Printf("Voltage: %f V\n", float64(voltage)/1000.0)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()
}
