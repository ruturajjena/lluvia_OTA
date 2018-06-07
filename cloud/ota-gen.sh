#!/bin/bash
device=$1
cd ~/cloud/OTA/config/cloud
oldzip=$(grep "<Filename>LLuvia-8.1" $device.xml  | sed -e 's|</\?Filename>||g')
newzip=$2
sed -i "s/$oldzip/$newzip/g" $device.xml
cd -
cd ~/cloud/OTA/config/cloud
echo "OTA Update for LLuvia $device $(date +%Y%m%d) Build" > /tmp/lluviaota
git commit -as -F /tmp/lluviaota
git pull --no-edit origin 8.1;
git push origin 8.1
cd -
rm -fv /tmp/lluviaota
