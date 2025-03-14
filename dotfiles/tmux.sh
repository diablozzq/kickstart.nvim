#!/bin/zsh

SESSIONNAME="tmux"

tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ]
then
    tmux new-session -s $SESSIONNAME -n nvim -d
    tmux send-keys -t $SESSIONNAME "nvim" C-m
fi

if [ -z ${TMUX+x} ]
then
    tmux attach -t $SESSIONNAME
fi
