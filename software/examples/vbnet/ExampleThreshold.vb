Imports System
Imports Tinkerforge

Module ExampleThreshold
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Analog In Bricklet

    ' Callback subroutine for voltage reached callback
    Sub VoltageReachedCB(ByVal sender As BrickletAnalogIn, ByVal voltage As Integer)
        Console.WriteLine("Voltage: " + (voltage/1000.0).ToString() + " V")
    End Sub

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim ai As New BrickletAnalogIn(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Get threshold callbacks with a debounce time of 10 seconds (10000ms)
        ai.SetDebouncePeriod(10000)

        ' Register voltage reached callback to subroutine VoltageReachedCB
        AddHandler ai.VoltageReachedCallback, AddressOf VoltageReachedCB

        ' Configure threshold for voltage "smaller than 5 V"
        ai.SetVoltageCallbackThreshold("<"C, 5*1000, 0)

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
