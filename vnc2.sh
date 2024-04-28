#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt install task-kde-desktop
sudo apt install tigervnc-standalone-server tigervnc-common -y

vncpasswd << EOF
q1qq1q
q1qq1q
n
EOF

mv rdp/xstartup-kde ~/.vnc/xstartup

sudo chmod +x ~/.vnc/xstartup

cp /etc/X11/Xresources/x11-common ~/.Xresources
