#!/bin/bash

# Get available cowfiles with command: cowsay --list
cowfiles=(apt bud-frogs bunny calvin cheese cock cower daemon default dragon
	dragon-and-cow duck elephant elephant-in-snake eyes flaming-sheep fox
	ghostbusters gnu hellokitty kangaroo kiss koala kosh luke-koala
	mech-and-cow milk moofasa moose pony pony-smaller ren sheep skeleton
	snowman stegosaurus stimpy suse three-eyes turkey turtle tux unipony
	unipony-smaller vader vader-koala www)

# FaceMod flags
flags=(-b -d -g -p -s -t -w -y)

if command -v fortune > /dev/null 2>&1; then
	message="$(fortune)"
else
	message="No fortune 🥠"
fi

if command -v fortune > /dev/null 2>&1 && command -v cowsay > /dev/null 2>&1; then
	# Get length of cowfiles array
	length=${#cowfiles[@]}
	# Get random index
	index=$((RANDOM % length))
	# Get random cow
	cowfile=${cowfiles[$index]}
	echo "$(cowthink $flags -f $cowfile $message)"
	# echo "$(fortune | cowsay -dW 30))"
else
	echo "$message, no cowsay 🐄"
fi
