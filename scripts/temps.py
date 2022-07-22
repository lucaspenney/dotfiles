#!/usr/bin/env python3

import os
import subprocess

cmd = subprocess.run(['hostname'], capture_output=True, text=True)
hostname = cmd.stdout.strip()

output = ""

if hostname == "laptop":
	cmd = subprocess.run(['sensors'], capture_output=True, text=True)
	sensors = cmd.stdout.strip()
	groups = sensors.split("\n\n")

	for s in groups:
		lines = s.split("\n")
		if lines[0] == "k10temp-pci-00c3":
			temp = lines[2]
			temp = temp[temp.index('+'):]
			temp = temp[1:]
			output = temp
		if lines[0] == "asus-isa-0000":
			fan = lines[2]
			fan = fan[10:].strip()
			output += "(" + fan + ")  "

print(output)
