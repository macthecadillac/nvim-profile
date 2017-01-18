#!/bin/bash 
x-terminal-emulator -p tabtitle="$1" -e $HOME/.vim/plugin/external-tools.vim/execute.sh $2 &> /dev/null 
