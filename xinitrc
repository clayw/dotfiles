unclutter -idle 2 &

xset s off
xset dpms force off

gnome-settings-daemon &
nm-applet --sm-disable &
gnome-power-manager &
gnome-sound-applet &

xrdb ~/.Xresources

xmonad
