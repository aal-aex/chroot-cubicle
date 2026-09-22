#!/usr/bin/env bash


PYWAL_COLORS="$HOME/.cache/wal/colors-sketchybar.sh"
if [ -f "$PYWAL_COLORS" ]; then
  source "$PYWAL_COLORS"
else
  ITEM_BG=0x44ffffff
  ACCENT_COLOR=0xffffffff
  ACCENT_FG=0xff000000
  TEXT_COLOR=0xffffffff
fi

if [ -z "$FOCUSED_WORKSPACE" ]; then
    FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
fi

# Check if this workspace has open windows
OCCUPIED=$(aerospace list-windows --workspace "$1" --format '%{window-id}')

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    # sketchybar --set "$NAME" padding_left=2 padding_right=2 \
    sketchybar --set "$NAME" padding_left=4 padding_right=4 \
        drawing=on \
        background.color="$ACCENT_COLOR" \
        label.color="$TEXT_COLOR"
elif [ -n "$OCCUPIED" ]; then
    sketchybar --set "$NAME" padding_left=4 padding_right=4 \
        drawing=on \
        background.color="$BAR_COLOR" \
        label.color="$TEXT_COLOR"
else
    # Hide empty, unfocused workspaces
    sketchybar --set "$NAME" drawing=off
fi
