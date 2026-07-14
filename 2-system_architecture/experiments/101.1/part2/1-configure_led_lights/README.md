# Practice No.1: Turn on or off LEDs.

### ATTENTION:
This script has been written specifically to turn off/on/blink the red LED on the back of a lenovo thinkpad 480t.

I strongly suggest you to make sure the path of "YOUR" config file is same as it is in the script assigned to "config_file" variable.

If you read the script you can see a "10 $status" is being passed to my config file in /proc. the 10 represents my LED number, and $status is the user input when it executes the script. the input can be either on/off or blink.

The way of doing it in Lenovo T480:
```bash
echo "$LED_number $status" | sudo tee /proc/acpi/ibm/led
```

Thank you for your time.
