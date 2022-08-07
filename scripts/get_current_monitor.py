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
for line in lines:
	if (line.find(" connected") != -1):
		endNameIndex = line.find(" ")
		name = line[0:endNameIndex]
		monitors.append(name)
if (len(monitors) > 1):
	monitors.reverse()
	print(monitors[0])
else:
	print(monitors[0])
