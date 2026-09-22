#!/bin/env sh
sketchybar --add event aerospace_workspace_change

# Loop through a fixed range of 1 to 9 (matching your keybindings)
for sid in {1..9}; do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        background.color="$ITEM_BG" \
        background.corner_radius=5 \
        background.height=32 \
        background.drawing=on \
        label="$sid" \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done
