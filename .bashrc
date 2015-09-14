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
NENHUM="\[\033[0m\]" # Eliminar as Cores, deixar padrão)
 
## Cores de Fonte
#PRETO="\[\033[0;30m\]" # Black (Preto)
#VERMELHO="\[\033[0;31m\]" # Red (Vermelho)
#VERDE="\[\033[0;32m\]" # Green (Verde)
#AMARELO="\[\033[0;33m\]" # Yellow (Amarelo)
#AZUL="\[\033[0;34m\]" # Blue (Azul)
#MAGENTA="\[\033[0;35m\]" # Magenta (Vermelho Claro)
#CIANO="\[\033[0;36m\]" # Cyan (Ciano - Azul Claro)
BRANCO="\[\033[0;37m\]" # White (Branco)
CINZA="$BRANCO\[\033[2m"

#__## Efeito Negrito (bold) e cores
#NPRETO="\[\033[1;30m\]" # Bold+Black (Negrito+Preto)
NVERMELHO="\[\033[1;31m\]" # Bold+Red (Negrito+Vermelho)
NVERDE="\[\033[1;32m\]" # Bold+Green (Negrito+Verde)
NAMARELO="\[\033[1;33m\]" # Bold+Yellow (Negrito+Amarelo)
NAZUL="\[\033[38;5;26m\]" # Bold+Blue (Negrito+Azul)
NMAGENTA="\[\033[1;35m\]" # Bold+Magenta (Negrito+Vermelho Claro)
#NCIANO="\[\033[1;36m\]" # Bold+Cyan (Negrito+Ciano - Azul Claro)
#NBRANCO="\[\033[1;37m\]" # Bold+White (Negrito+Branco)

#__## Cores de fundo (backgroud)
#BPRETO="\[\033[40m\]" # Black (Preto)
#BVERMELHO="\[\033[41m\]" # Red (Vermelho)
#BVERDE="\[\033[42m\]" # Green (Verde)
#BAMARELO="\[\033[43m\]" # Yellow (Amarelo)
#BAZUL="\[\033[44m\]" # Blue (Azul)
#BMAGENTA="\[\033[45m\]" # Magenta (Vermelho Claro)
#BCIANO="\[\033[46m\]" # Cyan (Ciano - Azul Claro)
#BBRANCO="\[\033[47m\]" # White (Branco)

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

first_c(){
	echo "${1:0:1}"
}

if [ "$UID" -eq 0 ]
then
	S_COLOR="$NVERMELHO"
else
	S_COLOR="$NMAGENTA"
fi

APS1=\
"${debian_chroot:+($debian_chroot)}\
{\$(first_c \u)}$NVERDE@$NENHUM\h$CINZA:\$(nobasename)\n\
$NENHUM${NAZUL}\W$NENHUM\$(cbranch \"${CINZA} on $NENHUM$NAMARELO\")\
$NENHUM\$(backvim)$S_COLOR \\$ $NENHUM"

APS1_sem_cor=\
"${debian_chroot:+($debian_chroot)}\
{\$(first_c \u)}@\h:\$(nobasename)\n\
\W\$(cbranch \" on \")\
\$(backvim) \\$ "


unset BRANCO
unset NAMARELO
unset NMAGENTA
unset NVERMELHO
unset NAZUL
unset CINZA
unset NENHUM
##################################################

if [ "$color_prompt" = yes ]; then
  	PS1="$APS1"
else
	#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
	PS1="$APS1_sem_cor"
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


