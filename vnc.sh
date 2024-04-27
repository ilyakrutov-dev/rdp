apt-get update && apt install gnome-* tightvncserver 

vncserver << EOF
q1qq1q
q1qq1q
n
EOF
echo OK

# Останавливаем VNC сервер
vncserver -kill :1

echo "gnome-session &" >> /root/.vnc/xstartup

chmod -rwxr-xr-x /root/.vnc/xstartup

vncserver
