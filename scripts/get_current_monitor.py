#!/usr/bin/env python3

import os
import subprocess

cmd = subprocess.run(['hostname'], capture_output=True, text=True)
hostname = cmd.stdout.strip()

output = ""

cmd = subprocess.run(['xrandr'], capture_output=True, text=True)
xrandr = cmd.stdout.strip()
lines = xrandr.split("\n")
monitors = []

priority_list = ["DP-0", "eDP-1-0", "HDMI-A-1-0"]

for line in lines:
    if (line.find(" connected") != -1):
        endNameIndex = line.find(" ")
        name = line[0:endNameIndex]
        monitors.append(name)

# Filter monitors based on the priority list
monitors = [monitor for monitor in priority_list if monitor in monitors]

#sort monitors based on the priority list
monitors.sort(key=lambda x: priority_list.index(x))

if (len(monitors) > 1):
    monitors.reverse()
    print(monitors[1])
else:
    print(monitors[0])
