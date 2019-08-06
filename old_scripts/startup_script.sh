#!/bin/sh
tmux new-session -d -s 'main' -n 'irssi'
tmux send-keys -t 'irssi' 'irssi' Enter
tmux send-keys -t 'irssi' '/join #byah' Enter
tmux new-window -n 'htop'
tmux send-keys -t 'htop' 'htop' Enter
tmux new-window -n 'bash'
tmux new-session -d -s 'minecraft' -n 'minecraft'
tmux new-window -n 'bash'
