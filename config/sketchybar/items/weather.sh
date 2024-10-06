#!/bin/bash

weather=(
    updates=on
    update_freq=600 
    script="$PLUGIN_DIR/weather.lua" 
    icon.font="$FONT:Regular:13.0" 
    background.drawing=on 
	padding_right=5 
	padding_left=5
)

sketchybar -m \
    --add item weather right \
    --set weather "${weather[@]}" \
    --subscribe weather

