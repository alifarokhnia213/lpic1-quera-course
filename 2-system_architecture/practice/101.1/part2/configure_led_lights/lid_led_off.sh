#!/bin/bash

config_file="/proc/acpi/ibm/led"

echo "options: on, off, blink"
read status

echo "10 $status" | sudo tee "$config_file"
