# ALIASES

#	lists
# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

#verbose
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'

#List all packages installed
alias lspkg="dpkg --get-selections | grep -v deinstall"

#desliga o monitor
alias blindme="xset dpms force off"

#liga o monitor
alias bringmeback="xset dpms force on"

#Mostra o tamanho recursivamente do diretório atual
alias duh="du -hd 0 . | awk '{print $1}'"

#wgetimg - faz download das imagens
alias wgetimg="wget -rA jpeg,jpg,bmp,gif,png"

#cliboard
alias clipboard='xclip -selection clipboard'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#------------------------------------------------------------------#
