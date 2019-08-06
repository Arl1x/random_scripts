#!/bin/sh
tmux new-session -d -s main
    tmux rename-windows main
    tmux new-window -d -n irssi irssi
    tmux send-keys -t irssi '/join #byah' Enter
    tmux new-window -d -n htop htop
    tmux new-window -d -n misc
tmux new-session -d -s minecraft
    tmux rename-window minecraft
    tmux new-window -d -n bash
tmux attach-session -d -t main
