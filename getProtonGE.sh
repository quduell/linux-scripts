#!/bin/bash
clear
dir=~/.steam/root/compatibilitytools.d
echo -n "Enter link here dumbass: "
read link
wget $link -P /tmp/ 
if [ -d "$dir" ]; then
	rm -rf $dir/*
else
	mkdir -p $dir
fi
tar -xf /tmp/GE-Proton*.tar.gz -C $dir/
rm /tmp/GE-Proton*
