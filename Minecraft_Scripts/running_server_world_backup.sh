#!/usr/bin/bash

# This performs a back up of the world files without shutting down the server.

# set -x provides debugging output
set -x

# Step one is to kill the server session
# We use tmux send-keys to pipe the command to the proper pane where the server is running
mcsession_name=minecraft
mcwindow=${mcsession_name}:minecraft
mcpane=${mcwindow}.0
tmux send-keys -t "$mcpane" 'save-off' Enter
# Sleep to allow the save command to turn off
sleep 5s
# Manually force all files to be saved to the disk
tmux send-keys -t "$mcpane" '/say Saving World...' Enter
tmux send-keys -t "$mcpane" 'save-all' Enter
sleep 5s

OF="/home/arl1x/Documents/Minecraft"
cp -r $OF/BYAH $OF/BYAH_Temp_Backups

sleep 5s
tmux send-keys -t "$mcpane" 'save-on' Enter

set +x
