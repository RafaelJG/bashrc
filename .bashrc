##SCREEN#########################
if [ ! "$STY" ]
then
	exec screen -RR 
fi
#################################


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

#===========================================
# Váriavies com as Cores
#===========================================
__NONE="\[\033[0m\]" # Eliminar as Cores, deixar padrão)
 
## Cores de Fonte
#__K="\[\033[0;30m\]" # Black (Preto)
#__R="\[\033[0;31m\]" # Red (Vermelho)
#__G="\[\033[0;32m\]" # Green (Verde)
#__Y="\[\033[0;33m\]" # Yellow (Amarelo)
#__B="\[\033[0;34m\]" # Blue (Azul)
#__M="\[\033[0;35m\]" # Magenta (Vermelho Claro)
#__C="\[\033[0;36m\]" # Cyan (Ciano - Azul Claro)
#__W="\[\033[0;37m\]" # White (Branco)

#__## Efeito Negrito (bold) e cores
#__BK="\[\033[1;30m\]" # Bold+Black (Negrito+Preto)
__BR="\[\033[1;31m\]" # Bold+Red (Negrito+Vermelho)
__BG="\[\033[1;32m\]" # Bold+Green (Negrito+Verde)
__BY="\[\033[1;33m\]" # Bold+Yellow (Negrito+Amarelo)
__BB="\[\033[38;5;26m\]" # Bold+Blue (Negrito+Azul)
#__BM="\[\033[1;35m\]" # Bold+Magenta (Negrito+Vermelho Claro)
#__BC="\[\033[1;36m\]" # Bold+Cyan (Negrito+Ciano - Azul Claro)
__BW="\[\033[1;37m\]" # Bold+White (Negrito+Branco)

#__## Cores de fundo (backgroud)
#__BGK="\[\033[40m\]" # Black (Preto)
#__BGR="\[\033[41m\]" # Red (Vermelho)
#__BGG="\[\033[42m\]" # Green (Verde)
#__BGY="\[\033[43m\]" # Yellow (Amarelo)
#__BGB="\[\033[44m\]" # Blue (Azul)
#__BGM="\[\033[45m\]" # Magenta (Vermelho Claro)
#__BGC="\[\033[46m\]" # Cyan (Ciano - Azul Claro)
#__BGW="\[\033[47m\]" # White (Branco)

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#import function on .bash_function.d
if [ -d ~/.bash_function.d ] ; then
	for func in ~/.bash_function.d/*.sh
	do
		source "$func"
	done
fi

################################
#
# PSI COM CORES
#
###############################

#cinza
__CIN="\[\033[38;5;250m\]"
__BCIN="\[\033[38;5;236m\]"

APS1=\
"${debian_chroot:+($debian_chroot)}\
$__CIN┌─\$(erro)\$([ \j -ne 0 ] && echo -n \"(\j)\")\
[$__NONE$__BW\u\
$__BG@$__NONE\h:\
$__BCIN\$(nobasename)$__NONE$__CIN]$__NONE\n\
$__CIN└ᐅ$__NONE $__BB\W$__NONE\
\$(cbranch \"$__CIN on $__BY\") $__BCIN\$(backvim)$__BR\$$__NONE "


##################################################

if [ "$color_prompt" = yes ]; then
    PS1="$APS1"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac



# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


