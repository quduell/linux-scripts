#!/bin/bash
link=$(curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep browser_download_url | cut -d\" -f4 | grep -e .tar.gz)
latestVersion=$(echo $link | cut -d/ -f8)
dir=~/.steam/root/compatibilitytools.d
echo -n "Your proton version is "
if [[ $(ls $dir) ]]; then
	currentVersion=$(ls $dir)
	echo $currentVersion
else
	echo "n/a"
fi
if [[ $latestVersion == $currentVersion ]]; then
	echo "You have the latest version, exiting..."
	exit 
fi
echo
read -p "Did you want to download the latest protonGE ($latestVersion) from $link? (y/n) " decision
if [[ $decision == "y" ]]; then
	curl -LOJ $link && mv GE-Proton* /tmp
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
