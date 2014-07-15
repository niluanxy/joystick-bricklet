function matlab_example_callback()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletJoystick;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'dmC'; % Change to your UID

    ipcon = IPConnection(); % Create IP connection
    js = BrickletJoystick(UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Register callbacks for pressed and released events
    set(js, 'PressedCallback', @(h, e) cb_pressed(e));
    set(js, 'ReleasedCallback', @(h, e) cb_released(e));

    input('Press any key to exit...\n', 's');
    ipcon.disconnect();
end

% Callback function for pressed and released events 
function cb_pressed(e)
    fprintf('Pressed\n');
end

function cb_released(e)
    fprintf('Released\n');
end