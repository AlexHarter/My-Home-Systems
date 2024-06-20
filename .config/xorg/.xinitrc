xrandr
xrdb -merge /home/alex/.Xresources
feh --bg-fill /home/alex/Pictures/Lake_Conroe.jpg
picom &
pipewire &
pipewire-pulse &
wireplumber &
exec dbus-run-session /home/alex/.local/bin/dwm
