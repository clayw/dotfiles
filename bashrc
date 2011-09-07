#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias emacs='emacs -nw'

alias scikit='source /home/clay/dev/scikit_env/bin/activate'
alias pypy_env='source /home/clay/dev/pypy_env/bin/activate'
