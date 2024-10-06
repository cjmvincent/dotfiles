#!/usr/bin/env sh

POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

sketchybar --add item clipboard right                        \
         --set clipboard script="python3 $PLUGIN_DIR/clipboard.py" \
                    updates=on                             \
                    update_freq=30                    \
                    icon=$CLIPBOARD                              \
                    background.padding_right=10            \
                    click_script="python3 $PLUGIN_DIR/clipboard.py && $POPUP_CLICK_SCRIPT" \
                    icon.font="$FONT:Regular:18.0"       \
         --add item clipboard.template left popup.clipboard \
