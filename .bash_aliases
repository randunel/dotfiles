export PATH=$PATH:/home/randunel/.cargo/bin

export UB_ROOT=~/projects/inventures
export RUST_SRC_PATH=/usr/local/src/rust/src

export PS_user='\[\033[1;92m\]\u';
export PS_docker='\[\033[0;31m\]$CODENAME';
export PS_docker_separator='\[\033[0m\]/';
export PS_node='\[\033[1;31m\]$NODE_ENV';
export PS_cwd='\[\033[1;34m\]\w';
export PS_git='\[\033[1;93m\]$(__git_ps1)';
export PS_prompt='\[\033[1;34m\]\$\[\033[0m\] ';

PS1="$PS_user $PS_docker$PS_docker_separator$PS_node $PS_cwd$PS_git\n$PS_prompt";

# PS1='\[\033[1;92m\]\u \[\033[0;31m\]$CODENAME\[\033[0m\]/\[\033[1;31m\]$NODE_ENV \[\033[1;34m\]\w\[\033[1;93m\]$(__git_ps1) \n\[\033[1;34m\]\$\[\033[0m\] '

export UB_INF_ROOT='/home/randunel/projects/inventures/infrastructure'

alias :e='nvim'
alias vim='nvim'
alias vnc='vinagre'
alias darktable='/opt/darktable/bin/darktable'
alias xclipboard="xclip -selection clipboard"
alias nauti="nautilus --no-desktop"
alias hdmimirror="xrandr --output HDMI-1 --auto --same-as LVDS-1"
alias hdmimirroroff="xrandr --output HDMI-1 --off"
alias dc="docker-compose"
alias dm="docker-machine"
