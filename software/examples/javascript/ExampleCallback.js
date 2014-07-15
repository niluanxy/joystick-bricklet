var Tinkerforge = require('tinkerforge');

var HOST = 'localhost';
var PORT = 4223;
var UID = 'dmG'; // Change to your UID

var ipcon = new Tinkerforge.IPConnection(); // Create IP connection
var js = new Tinkerforge.BrickletJoystick(UID, ipcon); // Create device object

ipcon.connect(HOST, PORT,
    function(error) {
        console.log('Error: '+error);
    }
); // Connect to brickd
// Don't use device before ipcon is connected

// Register callbacks for pressed and released events
js.on(Tinkerforge.BrickletJoystick.CALLBACK_PRESSED,
    function() {
        console.log('Pressed');
    }
);
js.on(Tinkerforge.BrickletJoystick.CALLBACK_RELEASED,
    function() {
        console.log('Released');
    }
);

console.log("Press any key to exit ...");
process.stdin.on('data',
    function(data) {
        ipcon.disconnect();
        process.exit(0);
    }
);