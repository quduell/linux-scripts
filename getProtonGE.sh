#!/bin/bash
clear
link=$(curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep browser_download_url | cut -d\" -f4 | grep -e .tar.gz)
read -p "Did you want to download the latest protonGE from $link? (y/n) " decision
if [ $decision == "y" ]; then
	curl -LOJ $(curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep browser_download_url | cut -d\" -f4 | grep -e .tar.gz) && mv GE-Proton* /tmp
	dir=~/.steam/root/compatibilitytools.d
	if [ -d "$dir" ]; then
		echo "Clearing compatibilitytools.d..."
		rm -rf $dir/*
	else
		mkdir -pv $dir
	fi
	echo "Extracting protonGE to compatibilitytools.d..."
	tar -xf /tmp/GE-Proton*.tar.gz -C $dir/
	rm /tmp/GE-Proton*
fi
