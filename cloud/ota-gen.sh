#!/bin/bash
device=$1
cd ~/cloud/OTA_config/cloud
oldzip=$(grep "<Filename>LLuvia-ham-8.1-OFFICIAL-20180604-0835.zip" ham.xml  | sed -e 's|</\?Filename>||g')
newzip=$2
sed -i "s/$oldzip/$newzip/g" ham.xml
cd -
cd ~/cloud/OTA_config/cloud
echo "OTA Update for lluvia $device $(date +%Y%m%d) Build" > /tmp/lluviaota
git commit -as -F /tmp/lluviaota
git pull --no-edit origin 8.1;
git push origin 8.1
cd -
rm -fv /tmp/lluviaota
