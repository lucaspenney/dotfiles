import subprocess
import json


result = subprocess.run("/usr/bin/sensors -j", shell=True, capture_output=True)
jsonStr = result.stdout

data = json.loads(jsonStr)

for index, sensor in enumerate(data):
    print(sensor)
    for i2, property in enumerate(data[sensor]):
        print(data[sensor][property])
    print("\n")
