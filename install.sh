#!/bin/sh
set -e
if [ `id -u` -ne 0 ]; then
   echo "Must be run as root." 
   exit 1
fi
if [ ! -d "/usr/local/bin" ]; then
	echo "Creating /usr/local/bin"
	mkdir -p /usr/local/bin 
fi
echo "Copying denag to /usr/local/bin"
cp denag /usr/local/bin 
echo "Creating /usr/denag"
mkdir -p /usr/denag 
echo "Populating /usr/denag with symlinks to driverwrap"
ln -sf /usr/lib/driverwrap /usr/denag/CC 
ln -sf /usr/lib/driverwrap /usr/denag/c89 
ln -sf /usr/lib/driverwrap /usr/denag/cc 
echo "Replacing symlinks in /usr/bin"
ln -sf /usr/local/bin/denag /usr/bin/CC 
ln -sf /usr/local/bin/denag /usr/bin/c89 
ln -sf /usr/local/bin/denag /usr/bin/cc 
echo "Done!"
