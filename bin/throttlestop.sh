#!/bin/bash
MAX_CPU=$((`nproc --all` - 1));

for i in $(seq 0 $MAX_CPU); do
    cpufreq-set -c $i -g performance;
done

modprobe msr;
wrmsr -a 0x1a0 0x850089;
wrmsr 0x1FC $((`rdmsr -d 0x1FC` - 1));
echo 0 | tee /sys/devices/system/cpu/intel_pstate/no_turbo >/dev/null;
