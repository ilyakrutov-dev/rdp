sudo apt-get update && apt install gnome-* tightvncserver 

vncserver << EOF
q1qq1q
q1qq1q
n
EOF
echo OK

# Останавливаем VNC сервер
vncserver -kill :1

sudo echo "gnome-session &" >> ~/.vnc/xstartup

sudo chmod -rwxr-xr-x ~/.vnc/xstartup

vncserver
