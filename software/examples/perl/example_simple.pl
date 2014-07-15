#!/usr/bin/perl  

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletJoystick;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => '6j9'; # Change to your UID

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $js = Tinkerforge::BrickletJoystick->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Get current position (returned as tuple x,y)
my ($x, $y) = $js->get_position();
print "Position[x]: $x\n";
print "Position[y]: $y\n";

print "Press any key to exit...\n";
<STDIN>;
$ipcon->disconnect();