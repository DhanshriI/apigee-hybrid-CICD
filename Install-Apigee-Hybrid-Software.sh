#!/bin/bash

echo Download Apigee hybrid distribution for 64-bit linux OS
cd ~
curl -LO https://storage.googleapis.com/apigee-release/hybrid/apigee-hybrid-setup/1.6.4/apigeectl_linux_64.tar.gz
rm -r ~/apigee
mkdir ~/apigee
tar xvzf apigeectl_linux_64.tar.gz -C ~/apigee

echo Set up the directories
cd ~/apigee
mv apigeectl* apigeectl.1.6.4
ln -s apigeectl.1.6.4 apigeectl
export APIGEECTL_HOME=~/apigee/apigeectl; 
echo $APIGEECTL_HOME
cd ~; 
echo "---------------------------"
echo "Apigeeclt version"
./apigeectl version
echo "---------------------------"
$APIGEECTL_HOME/apigeectl version
ls -al apigee

echo Update the setup script
cat >> ~/apigee-env-test.sh << EOF export APIGEECTL_HOME=~/apigee/apigeectl alias apigeectl=$APIGEECTL_HOME/apigeectl EOF

echo Create a home for hybrid files
mkdir -p ~/apigee/hybrid-files
cd ~/apigee/hybrid-files
mkdir overrides service-accounts certs
ln -s $APIGEECTL_HOME/tools tools
ln -s $APIGEECTL_HOME/config config
ln -s $APIGEECTL_HOME/templates templates
ln -s $APIGEECTL_HOME/plugins plugins
ls -al
sleep 120
