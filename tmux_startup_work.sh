#!/bin/zsh
tmux new-session -d -s main
	tmux rename-window main
	tmux new-window -d -n home
	tmux new-window -d -n htop htop
	tmux new-window -d -n super-etl
	tmux new-window -d -n ssh1
	tmux new-window -d -n ssh2
	tmux attach-session -d -t main

