export RUST_SRC_PATH='/home/mikael/git/rust/src'

hsetroot -full ~/images/mikael-mtb1.jpg &
xsetroot -cursor_name left_ptr &
xdotool mousemove --sync 1920 1080 &
#unclutter &
/home/mikael/scripts/touchpad_toggle.sh &
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --widthtype pixel --transparent true --alpha 75 --tint 0x000000 --width 100 --height 18 &
xcompmgr &
dropbox &
pulseaudio --start &
xmonad
