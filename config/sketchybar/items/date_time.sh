sketchybar -m --add       item               time             right                                        \
              --set       time               update_freq=2                                                 \
                                             icon.padding_right=0                                          \
                                             label.padding_left=0                                          \
                                             script="~/.config/sketchybar/plugins/time.sh"                 \
                                                                                                           \
              --add       item               date             right                                        \
              --set       date               update_freq=60                                                \
                                             background.color=0xffe8e8e9                                   \
                                             label.color=0xff000000                                        \
                                             label.font="SpaceMono Nerd Font:Semibold:13"                  \
                                             icon.padding_right=0                                          \
                                             label.padding_left=3                                          \
					     label.padding_right=3					   \
					     padding_left=10						   \
                                             background.height=26                                          \
                                             background.corner_radius=8                                    \
                                             script="~/.config/sketchybar/plugins/date.sh"
