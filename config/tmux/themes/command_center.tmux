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

set -g @accent "blue"

set -g mode-style "fg=#82aaff,bg=#3b4261"

set -g message-style "fg=#82aaff,bg=#3b4261"
set -g message-command-style "fg=#82aaff,bg=#3b4261"

set -g pane-border-style "fg=#3b4261"
set -g pane-active-border-style "fg=#82aaff"

set -g status "on"
set -g status-justify "absolute-centre"

set -g status-style "fg=#82aaff,bg=#1e2030"

set -g status-left-length "100"
set -g status-right-length "100"
 
set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#1b1d2b,bg=#{@accent},bold] #S #[fg=#{@accent},bg=#1e2030,nobold,nounderscore,noitalics]#[fg=#{@gray},bg=#1e2030,nobold,nounderscore,noitalics]❯#[fg=#{@yellow},bg=#1e2030,nobold,nounderscore,noitalics]❯#[fg=#{@red},bg=#1e2030,nobold,nounderscore,noitalics]❯#[fg=#{@green},bg=#1e2030,nobold,nounderscore,noitalics]❯#[fg=#{@pink},bg=#1e2030,nobold,nounderscore,noitalics]❯#[fg=#{@blue},bg=#1e2030,nobold,nounderscore,noitalics]❯"
set -g status-right "#[fg=#1e2030,bg=#1e2030,nobold,nounderscore,noitalics]#[fg=#82aaff,bg=#1e2030] #{prefix_highlight} #[fg=#3b4261,bg=#1e2030,nobold,nounderscore,noitalics]#[fg=#82aaff,bg=#3b4261] %Y-%m-%d  %H:%M %p #[fg=#{@accent},bg=#3b4261,nobold,nounderscore,noitalics]#[fg=#1b1d2b,bg=#{@accent},bold] #h "


setw -g window-status-activity-style "underscore,fg=#828bb8,bg=#1e2030"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#828bb8,bg=#1e2030"
setw -g window-status-format "#[fg=#1e2030,bg=#{?#{==:#{e|m|:#{window_index},5},0},#{@yellow},#{?#{==:#{e|m|:#{window_index},5},1},#{@red},#{?#{==:#{e|m|:#{window_index},5},2},#{@green},#{?#{==:#{e|m|:#{window_index},5},3},#{@pink},#{@blue}}}}},nobold,nounderscore,noitalics]#[fg=#1b1d2b,bg=#{?#{==:#{e|m|:#{window_index},5},0},#{@yellow},#{?#{==:#{e|m|:#{window_index},5},1},#{@red},#{?#{==:#{e|m|:#{window_index},5},2},#{@green},#{?#{==:#{e|m|:#{window_index},5},3},#{@pink},#{@blue}}}}}] 󱗼  #W #F #[fg=#1e2030,bg=#{?#{==:#{e|m|:#{window_index},5},0},#{@yellow},#{?#{==:#{e|m|:#{window_index},5},1},#{@red},#{?#{==:#{e|m|:#{window_index},5},2},#{@green},#{?#{==:#{e|m|:#{window_index},5},3},#{@pink},#{@blue}}}}},nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#1e2030,bg=#{?#{==:#{e|m|:#{window_index},5},0},#{@yellow},#{?#{==:#{e|m|:#{window_index},5},1},#{@red},#{?#{==:#{e|m|:#{window_index},5},2},#{@green},#{?#{==:#{e|m|:#{window_index},5},3},#{@pink},#{@blue}}}}},nobold,nounderscore,noitalics]#[fg=#1b1d2b,bg=#{?#{==:#{e|m|:#{window_index},5},0},#{@yellow},#{?#{==:#{e|m|:#{window_index},5},1},#{@red},#{?#{==:#{e|m|:#{window_index},5},2},#{@green},#{?#{==:#{e|m|:#{window_index},5},3},#{@pink},#{@blue}}}}},bold] 󱗼  #W #F #[fg=#1e2030,bg=#{?#{==:#{e|m|:#{window_index},5},0},#{@yellow},#{?#{==:#{e|m|:#{window_index},5},1},#{@red},#{?#{==:#{e|m|:#{window_index},5},2},#{@green},#{?#{==:#{e|m|:#{window_index},5},3},#{@pink},#{@blue}}}}},nobold,nounderscore,noitalics]"

# tmux-plugins/tmux-prefix-highlight support
set -g @prefix_highlight_output_prefix "#[fg=#ffc777]#[bg=#1e2030]#[fg=#1e2030]#[bg=#ffc777]"
set -g @prefix_highlight_output_suffix ""
