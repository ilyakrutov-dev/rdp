apt-get update && apt install xfce4-goodies tightvncserver xfce4

vncserver << EOF
q1qq1q
q1qq1q
n
EOF
echo OK

# Останавливаем VNC сервер
vncserver -kill :1

echo "startxfce4 &" >> /root/.vnc/xstartup

chmod -rwxr-xr-x /root/.vnc/xstartup

vncserver
