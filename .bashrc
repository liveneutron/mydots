#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

#applying pywall theme automatic
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

date


#my alias
alias vim='nvim'
