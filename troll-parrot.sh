#!/bin/bash

for i in {1..77}
do
	gnome-terminal -- bash -c "curl parrot.live; exec bash"
done
