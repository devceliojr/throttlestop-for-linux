#!/bin/bash

sudo apt install sudo wget dos2unix msr-tools cpufrequtils -y;

wget https://raw.githubusercontent.com/devceliojr/throttlestop-for-linux/main/bin/throttlestop.sh -O /usr/bin/throttlestop;
wget https://raw.githubusercontent.com/devceliojr/throttlestop-for-linux/main/bin/throttlestop.service -O /etc/systemd/system/throttlestop.service;

dos2unix /usr/bin/throttlestop;
dos2unix /etc/systemd/system/throttlestop.service;

sudo chmod +x /usr/bin/throttlestop;
sudo systemctl daemon-reload;
sudo systemctl enable throttlestop.service;
reboot;

