#!/bin/bash
sudo apt-get update 
sudo apt-get install -y --no-install-recommends \
ubuntu-desktop \
gnome-panel \
gnome-settings-daemon \
metacity \
nautilus \
gnome-terminal \
vnc4server

vncserver :1
vncserver -kill :1
cat > ~/.vnc/xstartup <<EOF
#!/bin/sh

# Uncomment the following two lines for normal desktop:
# unset SESSION_MANAGER
# exec /etc/X11/xinit/xinitrc

[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey 
vncconfig -iconic &
x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
x-window-manager &
        
gnome-panel &
gnome-settings-daemon &
metacity &
nautilus &
EOF

sudo touch /etc/systemd/system/vncserver@.service
sudo sh -c "cat > /etc/systemd/system/vncserver@.service<<EOF
[Unit]
Description=Start vnc4server at startup
After=syslog.target network.target

[Service]
Type=forking
User=$USER
PAMName=login
PIDFile=/home/$USER/.vnc/%H:%i.pid
ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1
ExecStart=/usr/bin/vncserver -depth 24 -geometry 1280x800 :%i
ExecStop=/usr/bin/vncserver -kill :%i

[Install]
WantedBy=multi-user.target
EOF
"
sudo systemctl daemon-reload
sudo systemctl enable vncserver@1.service
sudo systemctl start vncserver@1
vncpasswd
