#!/bin/bash

# Обновляем список пакетов
sudo apt-get update -y

# Устанавливаем окружение рабочего стола GNOME
sudo apt-get install ubuntu-gnome-desktop -y

# Устанавливаем VNC сервер
sudo apt-get install tightvncserver -y

sudo dpkg-reconfigure gdm3

# Запускаем VNC сервер, чтобы создать первоначальные настройки
vncserver << EOF
q1qq1q
q1qq1q
n
EOF
echo OK

# Останавливаем VNC сервер
vncserver -kill :1

# Создаём новый конфигурационный файл для VNC сервера
echo "
#!/bin/sh
xrdb $HOME/.Xresources
xsetroot -solid grey
export XKL_XMODMAP_DISABLE=1 
/etc/X11/Xsession
gnome-session &
" > ~/.vnc/xstartup

# Делаем файл исполняемым
sudo chmod +x ~/.vnc/xstartup

# Запускаем VNC сервер с новыми настройками
vncserver
