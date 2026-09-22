#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

# if [ "$SENDER" = "front_app_switched" ]; then
#   sketchybar --set "$NAME" label="$INFO"
# fi

if [ "$SENDER" = "front_app_switched" ]; then
  MAX_LEN=10
  APP_NAME="$INFO"

  if [ ${#APP_NAME} -gt $MAX_LEN ]; then
    APP_NAME="${APP_NAME:0:$MAX_LEN}…"
  fi

  sketchybar --set "$NAME" label="$APP_NAME"
fi
