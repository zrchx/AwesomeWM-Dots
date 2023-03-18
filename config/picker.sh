# command and temporary file
CMD=$(gpick --no-newline -pso)
TMP=/tmp/picked_$CMD.png

# Convert and Copy
convert -size 120x120 xc:"$CMD" "$TMP"
printf %s "$CMD" | xclip -selection clipboard

# send notification
notify-send -a "Color picker" \
        -i "$TMP" \
        -t 2000 \
        "Color Picked!" "$CMD"
