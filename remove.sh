#!/bin/sh
set -e
if [ `id -u` -ne 0 ]; then
   echo "Must be run as root."
   exit 1
fi
echo "Removing /usr/denag"
rm -rf /usr/denag 
echo "Deleting /usr/local/bin/denag"
rm /usr/local/bin/denag 
echo "Restoring original /usr/bin symlinks"
ln -sf /usr/lib/driverwrap /usr/bin/CC 
ln -sf /usr/lib/driverwrap /usr/bin/c89 
ln -sf /usr/lib/driverwrap /usr/bin/cc 
echo "Done!"
