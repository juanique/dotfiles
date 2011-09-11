#!/bin/bash

##########
# prompt #
##########
# prompt is a template-like program designed to simplify the process of colourizing one's prompt.
# By analyzing the variables, it is easy to identify what ANSI colour sequences match up with which colour.
# Thus, modifying one's bash prompt is a simple matter of going through the variables and inserting the colour of choice.
#
# When the script is modified to your liking, you should place it a useful place (like ~/bin/).
# Then replace PS1="..." in your bootup file (~/.bashrc or ~/.bash_profile) with PS1=`~/bin/prompt` (those are backticks!)
#
# Only known to work as expected with bash
#
# No licensing or copyright is placed on this script. Do with it as you wish.

################################################
# THERE SHOULD BE NO NEED TO EDIT THIS SECTION #
################################################

#$normal will reset the colour to the default, use it to stop using a certain colour (see "prompt parts")
normal="\[\e[0m\]"

# # # # # # #
#BACKGROUNDS
# # # # # # #
nobg="m\]"
blackbg=";40m\]"
redbg=";41m\]"
greenbg=";42m\]"
brownbg=";43m\]"
bluebg=";44m\]"
purplebg=";45m\]"
cyanbg=";46m\]"
greybg=";47m\]"

############################################################################################
# THERE SHOULD BE NO NEED TO EDIT THIS SECTION (UNLESS YOU DO NOT WANT A CLEAR BACKGROUND) #
############################################################################################
# # # # # # #
#FOREGROUNDS
# # # # # # #
black="\[\e[0;30$nobg"
redfaint="\[\e[0;31$nobg"
greenfaint="\[\e[0;32$nobg"
brownfaint="\[\e[0;33$nobg"
bluefaint="\[\e[0;34$nobg"
purplefaint="\[\e[0;35$nobg"
cyanfaint="\[\e[0;36$nobg"
greyfaint="\[\e[0;37$nobg"

grey="\[\e[1;30$nobg"
red="\[\e[1;31$nobg"
green="\[\e[1;32$nobg"
yellow="\[\e[1;33$nobg"
blue="\[\e[1;34$nobg"
pink="\[\e[1;35$nobg"
cyan="\[\e[1;36$nobg"
white="\[\e[1;37$nobg"

##################################
# EDIT THIS STUFF TO YOUR LIKING #
##################################
# # # # # # #
#PROMPT PARTS
# # # # # # #
prompt_opening_brace="$yellow[$normal"
prompt_closing_brace="$yellow]$normal"

prompt_date="\d"
prompt_hostname_short="$blue\h$normal"
prompt_hostname_long="\H"
prompt_jobs="\j"
prompt_terminal="\l"
prompt_shellname="\s"
prompt_time_24="\t"
prompt_time_12="\T"
prompt_time_12_am_pm="\@"
prompt_username="$green\u$normal"
prompt_version="\v"
prompt_version_patchlevel="\V"
prompt_pwd_long="\w"
prompt_pwd_short="$red\W$normal"
prompt_history_number="\!"
prompt_session_number="\#"
prompt_usertype_sign="\\$"

# Aliases
# #######

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
 alias rm='rm -i'
 alias cp='cp -i'
 alias mv='mv -i'

# Default to human readable figures
# alias df='df -h'
# alias du='du -h'

# Misc :)
 alias less='less -r'                          # raw control characters
 alias vi='vim'

# Some shortcuts for different directory listings
# alias dir='ls --format=vertical'
 alias dir='ls -G' 
 alias ll='ls -l'                              # long list

# Colors!
 alias vim='vim -T xterm-color'
 alias ls='ls -G'
 alias ll='ls -l --color'
# alias ls='ls --color'

# IP mapping para rafiki
export MYIP=`echo $SSH_CLIENT | awk '{print $1}'`
export rafiki=$MYIP

#ruta de scripts
export PATH="$PATH:/bin:/usr/bin:~/scripts"

# set a nice looking prompt:
PS1='\u@\h:\W\$ '

# Functions
# #########

# Some example functions
# function settitle() { echo -ne "\e]2;$@\a\e]1;$@\a"; }

if [ -z "$PERL5LIB" ]
then
    # If PERL5LIB wasn't previously defined, set it...
    PERL5LIB=~/myperl/lib
else
    # ...otherwise, extend it.
    PERL5LIB=$PERL5LIB:~/myperl/lib
fi

MANPATH=$MANPATH:~/myperl/man

export PERL5LIB MANPATH

export NSYSTEM='/home/juanique/CC41B/nSystem2005sp2'
export EDITOR=vim
export VISUAL=vim
export GIT_EDITOR=vim
