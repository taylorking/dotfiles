# .bashrc
if [ "$SSH_TTY" ] 
then

  free -m | grep Mem
alias sudo='echo "null" >> /dev/null'
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export LD_LIBRARY_PATH=/u/css/kingtb/lib tmux mosh protobuf
alias sl='ls --color=auto'
alias l='ls --color=auto'
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias lal='ls -al --color=auto'
alias dir='ls --color=auto'
alias cls='clear'
alias md='~/bin/Markdown.pl'
PATH=/u/css/kingtb/bin:/u/css/kingtb/go-sys/bin/go/bin:$PATH
echo "" > /dev/stdout
fortune
# User specific aliases and functions
fi
 #Lines added by the Vim-R-plugin command :RpluginConfig (2014-Nov-13 16:18):
 #Change the TERM environment variable (to get 256 colors) and make Vim
 #connecting to X Server even if running in a terminal emulator (to get
 #dynamic update of syntax highlight and Object Browser):
 if [ "$TERM" = "screen" ] 
then
  export TERM="screen-256color"
fi
 if [ "$TERM" = "rxvt-unicode-256color" ]
 then 
    export TERM=xterm-256color
 fi
 if [ "$TERM" = "xterm" ] || [ "$TERM" = "xterm-256color" ]
then
    export TERM=xterm-256color
    export HAS_256_COLORS=yes
fi
if [ "$TERM" = "screen" ] && [ "$HAS_256_COLORS" = "yes" ]
then
    export TERM=screen-256color
fi
if [ "x$DISPLAY" != "x" ]
then
    alias vim="vim --servername VIM"
    if [ "$HAS_256_COLORS" = "yes" ]
    then
        function tvim(){ tmux new-session "TERM=screen-256color vim --servername VIM $@" ; }
    else
        function tvim(){ tmux new-session "vim --servername VIM $@" ; }
    fi
else
    if [ "$HAS_256_COLORS" = "yes" ]
    then
        function tvim(){ tmux new-session "TERM=screen-256color vim $@" ; }
    else
        function tvim(){ tmux new-session "vim $@" ; }
    fi
fi
unset SSH_ASKPASS
export GOPATH=/u/css/kingtb/go
export GOROOT=/u/css/kingtb/go-sys/bin/go
