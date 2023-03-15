export LC_CTYPE=pl_PL.UTF-8
export LC_ALL=pl_PL.UTF-8
export LANG=pl_PL.UTF-8

for i in "316 1" "317 6 7 4 5" "318 1" "319 150" "320 2"
  # WS Pointer Wheel Emulation (316)
  # WS Pointer Wheel Emulation Axes (317)
     # ^ default 0 0 4 5 means only vertical scroll, 6 7 add horiz
  # WS Pointer Wheel Emulation Inertia (318)
  # WS Pointer Wheel Emulation Timeout (319)
     # ^ middle button works only pressed that short
  # WS Pointer Wheel Emulation Button (320)
do
	xinput set-prop /dev/wsmouse $i  # wsmouse0 didn't work
done

xrdb -load ~/.Xresources
xidle &
st &
# (while emacs --iconic; do done) &
# fvwm
icewm-session
