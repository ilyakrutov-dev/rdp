#!/bin/bash

# Обновить систему
sudo apt update && sudo apt upgrade -y

# Установить среду GNOME
sudo apt install ubuntu-desktop -y

# Установить TightVNCServer
sudo apt install tightvncserver -y

vncserver << EOF
q1qq1q
q1qq1q
n
EOF
echo OK

# Остановить VNC-сервер
vncserver -kill :1

# Запустить VNC-сервер с использованием среды GNOME
vncserver -geometry 1920x1080 :1 -depth 24 -rfbport 5901

# Вывести IP-адрес и номер порта VNC-сервера
echo "VNC server is running on IP address: $(hostname -I) and port: 5901"
