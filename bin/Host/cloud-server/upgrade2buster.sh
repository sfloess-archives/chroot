#!/bin/bash

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 04EE7237B7D453EC 648ACFD622F3D138
grep -rl jessie /etc/apt/ | xargs sed -i 's/jessie/buster/g'
apt update -y && apt dist-upgrade -y

