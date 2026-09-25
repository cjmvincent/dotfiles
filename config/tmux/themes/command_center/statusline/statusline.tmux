set -g @red	"#e96c75"
set -g @lightred "#e06c75"
set -g @green "#23d18b"
set -g @lightgreen "#6bca78"
set -g @yellow "#feff6e"
set -g @lightyellow "#feff6e"
set -g @blue "#3b8eea"
set -g @lightblue "#61afef"
set -g @pink "#d670d6"
set -g @lightpink "#d670d6"
set -g @white "#f8f8f2"
set -g @black "#282a36"
set -g @lightgray "#666666"
set -g @gray "#282a36"
set -g @backg "#282a36"
set -g @accent "blue"

set -g mode-style "fg=#82aaff,bg=#3b4261"

set -g message-style "fg=#82aaff,bg=#3b4261"
set -g message-command-style "fg=#82aaff,bg=#3b4261"

set -g pane-border-style "fg=#3b4261"
set -g pane-active-border-style "fg=#82aaff"

source-file $HOME/.config/tmux/themes/command_center/statusline/hostname.tmux
source-file $HOME/.config/tmux/themes/command_center/statusline/mode_indicator.tmux
source-file $HOME/.config/tmux/themes/command_center/statusline/speedtest.tmux

set -g status "on"
set -g status-justify "right"

set -g status-style "fg=#82aaff,bg=#{@gray}"

set -g status-left-length "100"
set -g status-right-length "100"
 
set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#{tmux_mode_indicator}|"
#set -g status-right "#[fg=#{@backg},bg=#{@backg},nobold,nounderscore,noitalics]#[fg=#82aaff,bg=#{@backg}]#[fg=#3b4261,bg=#{@backg},nobold,nounderscore,noitalics]#[fg=#82aaff,bg=#3b4261]#{speedtest_result}  #[fg=#{@blue},bg=#3b4261,nobold,nounderscore,noitalics] #[fg=#{@accent},bg=#3b4261,nobold,nounderscore,noitalics]#[fg=#1b1d2b,bg=#{@accent},bold] #[bg=blue]#U#[bg=blue]@#H#{?#{pane_ssh_port},:#{pane_ssh_port},} "
set -g status-right "#[fg=#{@backg},bg=#{@backg},nobold,nounderscore,noitalics]#[fg=#82aaff,bg=#{@backg}]#[fg=#3b4261,bg=#{@backg},nobold,nounderscore,noitalics]#[fg=#82aaff,bg=#{@gray}] #{speedtest_result} #[fg=white,bg=#{@accent},bold] #U#@#H#{?#{pane_ssh_port},:#{pane_ssh_port},} "



setw -g window-status-activity-style "underscore,fg=#828bb8,bg=#{@backg}"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#828bb8,bg=#{@backg}"
setw -g window-status-format "#[fg=#{@backg},bg=#{?#{==:#{e|m|:#{window_index},5},0},#{@yellow},#{?#{==:#{e|m|:#{window_index},5},1},#{@red},#{?#{==:#{e|m|:#{window_index},5},2},#{@green},#{?#{==:#{e|m|:#{window_index},5},3},#{@pink},#{@blue}}}}},nobold,nounderscore,noitalics] #[fg=#1b1d2b,bg=#{?#{==:#{e|m|:#{window_index},5},0},#{@yellow},#{?#{==:#{e|m|:#{window_index},5},1},#{@red},#{?#{==:#{e|m|:#{window_index},5},2},#{@green},#{?#{==:#{e|m|:#{window_index},5},3},#{@pink},#{@blue}}}}}] 󱗼  #W #F #[fg=#{@backg},bg=#{?#{==:#{e|m|:#{window_index},5},0},#{@yellow},#{?#{==:#{e|m|:#{window_index},5},1},#{@red},#{?#{==:#{e|m|:#{window_index},5},2},#{@green},#{?#{==:#{e|m|:#{window_index},5},3},#{@pink},#{@blue}}}}},nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#{@backg},bg=#{?#{==:#{e|m|:#{window_index},5},0},#{@yellow},#{?#{==:#{e|m|:#{window_index},5},1},#{@red},#{?#{==:#{e|m|:#{window_index},5},2},#{@green},#{?#{==:#{e|m|:#{window_index},5},3},#{@pink},#{@blue}}}}},nobold,nounderscore,noitalics] #[fg=#1b1d2b,bg=#{?#{==:#{e|m|:#{window_index},5},0},#{@yellow},#{?#{==:#{e|m|:#{window_index},5},1},#{@red},#{?#{==:#{e|m|:#{window_index},5},2},#{@green},#{?#{==:#{e|m|:#{window_index},5},3},#{@pink},#{@blue}}}}},bold] 󱗼  #W #F #[fg=#{@backg},bg=#{?#{==:#{e|m|:#{window_index},5},0},#{@yellow},#{?#{==:#{e|m|:#{window_index},5},1},#{@red},#{?#{==:#{e|m|:#{window_index},5},2},#{@green},#{?#{==:#{e|m|:#{window_index},5},3},#{@pink},#{@blue}}}}},nobold,nounderscore,noitalics] "

# tmux-plugins/tmux-prefix-highlight support
set -g @prefix_highlight_output_prefix "#[fg=#ffc777]#[bg=#{@backg}]#[fg=#{@backg}]#[bg=#ffc777]"
set -g @prefix_highlight_output_suffix ""