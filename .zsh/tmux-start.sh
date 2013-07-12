#!/bin/sh
# File : tmux-start.sh
# URL :
# Author : kooothor
# Version :

function mux
{
    tmux new-session -d -s ktr -n mail 'cd $d && mutt'
    tmux new-window -t ktr -n dev
    tmux new-window
    
    tmux send-keys -t ktr:1 "cd $dev" C-m
    tmux send-keys -t ktr:2 "cd $d" C-m
     
    tmux select-window -t ktr:0
    tmux attach-session -t ktr
}
