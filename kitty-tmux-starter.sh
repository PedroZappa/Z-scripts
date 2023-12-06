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

#
# Launch a new kitty tab and attach it to the tmux session "RC"
kitty @ launch --type=tab sh -c 'tmux attach-session -t RC'

# Launch another kitty tab and attach it to the tmux session "Z"
kitty @ launch --type=tab sh -c 'tmux attach-session -t Z'

# Focus the new tab
# kitty @ focus-tab --match title:Z
# Create Z session
tmux new-session	-d -s Z
tmux attach-session -t Z
