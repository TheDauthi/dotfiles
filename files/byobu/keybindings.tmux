unbind-key -n C-a
set -g prefix ^B
set -g prefix2 ^B
bind a send-prefix

set -g utf8
set-window-option -g utf8 on

set-option -g -q mouse on


bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'copy-mode -e; send-keys -M'"

# Use Ctrl + scroll to scroll fast
bind -n C-WheelUpPane select-pane -t= \; copy-mode -e \; send-keys -M
bind -t vi-copy    C-WheelUpPane   halfpage-up
bind -t vi-copy    C-WheelDownPane halfpage-down

# bind C-y run "tmux show-buffer | xclip -i"
# bind C-p run "tmux set-buffer \"$(xclip -o)\"; tmux paste-buffer"
