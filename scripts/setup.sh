#!/bin/bash

# Setup go
echo -e "Setting up go\n"
BINARY_LOCATION="https://golang.org/dl/go1.17.1.linux-amd64.tar.gz"
DOWNLOAD_PATH=/tmp
wget -q $BINARY_LOCATION -P $DOWNLOAD_PATH
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf $DOWNLOAD_PATH/go1.17.1.linux-amd64.tar.gz

# sudo echo "PATH=$PATH:/usr/local/go/bin" >> /etc/profile 
export PATH=$PATH:/usr/local/go/bin

BASH_PROFILE_PATH=/home/vagrant/.profile

if [[ -f $BASH_PROFILE_PATH ]]; then
  echo "export PATH=$PATH:/usr/local/go/bin" >> $BASH_PROFILE_PATH
fi