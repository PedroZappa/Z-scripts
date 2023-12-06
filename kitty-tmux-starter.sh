#!/bin/bash

# Set Path to Obsidian Vault
OBSIDIAN_VAULT_PATH="/home/zedr0/Documents/Obsidian/ZedroVault"

# Create RC session
tmux new-session	-d -s RC
# Create .dotfiles RC window
tmux rename-window	-t RC:1 '.dotfiles'
tmux send-keys		-t RC:1 'cd ~/.dotfiles' C-m
tmux send-keys		-t RC:1 'nvim .' C-m
# Create obsidian RC window
tmux new-window		-t RC:2 -n 'obsidian' -c $OBSIDIAN_VAULT_PATH
tmux send-keys		-t RC:2 'll' C-m
tmux split-window	-t RC:2 -h 
tmux send-keys		-t RC:2 'obsidian' C-m
# Create Z-scripts RC window
tmux new-window		-t RC:3 -n 'Z-scripts'
tmux send-keys		-t RC:1 'cd ~/C0D3/Z-scripts' C-m
tmux send-keys		-t RC:3 'll' C-m

#
# Launch a new kitty tab and attach it to the tmux session "RC"
kitty @ launch --type=tab sh -c 'tmux attach-session -t RC'

# Launch another kitty tab and attach it to the tmux session "Z"
kitty @ launch --type=tab sh -c 'tmux attach-session -t Z'

# Create Z session
tmux new-session	-d -s Z
tmux attach-session -t Z

kitty @ focus-tab previous_tab
