#!/bin/bash

# Configure RDP_USER_PASSWORD and RDP_PASSWORD
RDP_USER_PASSWORD=$1
RDP_PASSWORD=$2
NGROK_AUTH_TOKEN=$3

# Disable spotlight indexing
sudo mdutil -i off -a

# Create new account
sudo dscl . -create /Users/rdpuser
sudo dscl . -create /Users/rdpuser UserShell /bin/bash
sudo dscl . -create /Users/rdpuser RealName "RDP User"
sudo dscl . -create /Users/rdpuser UniqueID 1001
sudo dscl . -create /Users/rdpuser PrimaryGroupID 80
sudo dscl . -create /Users/rdpuser NFSHomeDirectory /Users/rdpuser
sudo dscl . -passwd /Users/rdpuser $RDP_USER_PASSWORD
sudo createhomedir -c -u rdpuser > /dev/null

# Enable RDP
sudo /usr/sbin/systemsetup -setremotelogin on

# Set RDP password
sudo /usr/sbin/systemsetup -setremoteaccesspassword $RDP_PASSWORD

# Install ngrok
brew install --cask ngrok

# Configure ngrok and start it
ngrok authtoken $NGROK_AUTH_TOKEN
ngrok tcp 3389 &

# Start RDP service
sudo /usr/sbin/systemsetup -startremotelogin
