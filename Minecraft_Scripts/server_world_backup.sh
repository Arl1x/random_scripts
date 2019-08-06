#!/usr/bin/bash

# Used for general server maintenance of #byah Minecraft Server.
# This includes backing up the world files.

# set -x provides debugging output
set -x

# Step one is to kill the server session
# We use tmux send-keys to pipe the command to the proper pane where the server is running
mcsession_name=minecraft
mcwindow=${mcsession_name}:minecraft
mcpane=${mcwindow}.0
#tmux send-keys -t "$mcpane" 'stop' Enter
# Sleep for a few seconds to allow the server to shut down properly and save properly
#sleep 5s

# Step two is to run the backup
OF="/home/arl1x/Documents/Minecraft"
tar -czf $OF/BYAH-BACKUPS/BYAH_Server_$(date +\%Y-\%m-\%d).tar.gz -C /home/arl1x/Documents/Minecraft/BYAH_Temp_Backups BYAH

# Step three is to send the proper commands to the proper pane and restart the server.
#tmux send-keys -t "$mcpane" 'cd /home/arl1x/Documents/Minecraft' Enter
#tmux send-keys -t "$mcpane" 'java -Xms1G -Xmx4G -jar minecraft_server.1.8.3.jar nogui' Enter

# Turn off the debugging output
set +x
