#!/bin/bash

MAX_CPU=$((`nproc --all` - 1));

for i in $(seq 0 $MAX_CPU); do
    
    -set -c $i -g performance;
done

modprobe msr
wrmsr -a 0x1a0 0x850089
echo 0 | tee /sys/devices/system/cpu/intel_pstate/no_turbo >/dev/null