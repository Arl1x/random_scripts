#!/usr/bin/bash

# Used for running maintenance of the map files for the #Byah Minecraft Server.
# Step 1: Backup old map and zip the files
# Step 2: run the new generation
# Step 3: transfer the map generation into the web server

# Step 1
OF="/home/arl1x/Documents/Minecraft"
tar -czf $OF/Map_Backups/BYAH_Map_$(date +\%Y-\%m-\%d).tar.gz -C /var/www html

# Step 2
overviewer.py --config=$OF/overviewer.conf --check-tiles

# Step 3
sudo cp -r $OF/BYAH-map_Overviewer/* /var/www/html
