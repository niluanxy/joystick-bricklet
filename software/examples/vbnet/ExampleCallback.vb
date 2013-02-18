Imports Tinkerforge

Module ExampleCallback
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "6j9" ' Change to your UID

    ' Callback functions for pressed and released events
    Sub PressedCB(ByVal sender As BrickletJoystick)
        System.Console.WriteLine("Pressed")
    End Sub

    Sub ReleasedCB(ByVal sender As BrickletJoystick)
        System.Console.WriteLine("Released")
    End Sub

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim js As New BrickletJoystick(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Register callbacks for pressed and released events
        AddHandler js.Pressed, AddressOf PressedCB
        AddHandler js.Released, AddressOf ReleasedCB

        System.Console.WriteLine("Press key to exit")
        System.Console.ReadKey()
        ipcon.Disconnect()
    End Sub
End Module
