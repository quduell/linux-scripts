#!/bin/bash
clear
dir=~/.steam/root/compatibilitytools.d
echo -n "Enter link here dumbass: "
read link
wget $link -P ~/Desktop/
if [ -d "$dir" ]; then
	rm -rf $dir/*
else
	mkdir -p $dir
fi
tar -xf ~/Desktop/GE-Proton*.tar.gz -C $dir/
rm ~/Desktop/GE-Proton*
