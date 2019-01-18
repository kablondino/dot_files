#!/bin/bash

IMAGE=/tmp/i3lock.png
SCREENSHOT="scrot $IMAGE"
ICON=~/.lock.png

BLURTYPE="0x4"
BRIGHTNESS="50"  # Percent
SATURATION="70"

# Take the screenshot
$SCREENSHOT

# Blur and dim both brightness and saturation
convert $IMAGE -blur $BLURTYPE -modulate $BRIGHTNESS,$SATURATION $IMAGE

# Pixelate the image
convert $IMAGE -scale 10% -scale 1000% $IMAGE

# Add lock icon, with geometry at 1080p
#convert $IMAGE $ICON -geometry +832+412 +composite +matte $IMAGE

# Lock the screen
i3lock -i $IMAGE

# Remove the image upon re-entry
rm $IMAGE

