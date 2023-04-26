#!/bin/bash
clear
echo -n "Enter link here dumbass: "
read link
wget $link -P ~/Desktop
tar -xf GE-Proton*
rm GE-Proton*.tar.gz
rm -rf ~/.steam/root/compatibilitytools.d/*
mv GE-Proton* ~/.steam/root/compatibilitytools.d/
