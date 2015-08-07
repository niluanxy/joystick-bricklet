#!/usr/bin/env python
# -*- coding: utf-8 -*-

HOST = "localhost"
PORT = 4223
UID = "XYZ" # Change to your UID

from tinkerforge.ip_connection import IPConnection
from tinkerforge.bricklet_joystick import BrickletJoystick

# Callback for x and y position outside of [-99..99]
def cb_reached(x, y):
    if y == 100:
        print('Top')
    elif y == -100:
        print('Bottom')

    if x == 100:
        print('Right')
    elif x == -100:
        print('Left')

    print('')

if __name__ == "__main__":
    ipcon = IPConnection() # Create IP connection
    j = BrickletJoystick(UID, ipcon) # Create device object

    ipcon.connect(HOST, PORT) # Connect to brickd
    # Don't use device before ipcon is connected

    # Get threshold callbacks with a debounce time of 0.2 seconds (200ms)
    j.set_debounce_period(200)

    # Register threshold reached callback to function cb_reached
    j.register_callback(j.CALLBACK_POSITION_REACHED, cb_reached)

    # Configure threshold for "x and y value outside of [-99..99]"
    j.set_position_callback_threshold('o', -99, 99, -99, 99)

    raw_input('Press key to exit\n') # Use input() in Python 3
    ipcon.disconnect()
