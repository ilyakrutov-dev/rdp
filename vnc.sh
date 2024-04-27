sudo apt-get update
sudo apt-get install --no-install-recommends ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal vnc4server

vncserver << EOF
q1qq1q
q1qq1q
n
EOF
echo OK

vncserver -kill :1

mv rdp/xstartup ~/.vnc/xstartup

iptables -A INPUT -p tcp --dport 5901 -j ACCEPT
iptables-save

vncserver
