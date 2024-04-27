sudo apt update

sudo apt install xfce4 xfce4-goodies

sudo apt install tightvncserver

# Запускаем VNC сервер, чтобы создать первоначальные настройки
vncserver << EOF
q1qq1q
q1qq1q
n
EOF
echo OK

vncserver -kill :1

sudo mv rdp/xstartup ~/.vnc/xstartup

sudo chmod +x ~/.vnc/xstartup

vncserver -geometry 1920x1080
