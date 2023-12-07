#!/bin/bash

# Set Path to Obsidian Vault
if [[ $USER == "zedr0" ]]; then
	OBSIDIAN_VAULT_PATH="~/Documents/Obsidian/ZedroVault"
else [[ $USER == "passunca" ]];
	OBSIDIAN_VAULT_PATH="~/sgoinfre/Obsidian/ZedroVault"
fi

# Create RC session
tmux new-session	-d -s RC
# Create .dotfiles RC window
tmux rename-window	-t RC:1 '.dotfiles'
tmux send-keys		-t RC:1 'cd ~/.dotfiles' C-m
tmux send-keys		-t RC:1 'nvim .' C-m
# Create Z-scripts RC window
tmux new-window		-t RC:2 -n 'z-scripts'
tmux send-keys		-t RC:2 'cd ~/C0D3/z-scripts' C-m
tmux send-keys		-t RC:2 'nvim .' C-m
# Create obsidian RC window
tmux new-window		-t RC:3 -n 'obsidian' -c $OBSIDIAN_VAULT_PATH
tmux send-keys		-t RC:3 'cd '$OBSIDIAN_VAULT_PATH C-m
tmux send-keys		-t RC:3 'll' C-m
tmux split-window	-t RC:3 -h 
tmux send-keys		-t RC:3 'git pull --verbose' C-m
tmux send-keys		-t RC:3 'obsidian' C-m
# Create Monitoring RC window
tmux new-window		-t RC:4 -n 'ztop'
if command -v btop &> /dev/null
then
	tmux send-keys	-t RC:4 'btop' C-m
else if command -v htop &> /dev/null
	tmux send-keys	-t RC:4 'htop' C-m
else
	tmux send-keys	-t RC:4 'top' C-m
fi

# Launch a new kitty tab and attach it to the tmux session "RC"
kitty @ launch --type=tab sh -c 'tmux attach-session -t RC'

# Create Z session
tmux new-session	-d -s Z
tmux attach-session -t Z
