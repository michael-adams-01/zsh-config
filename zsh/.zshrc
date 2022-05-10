###############################################################################################################################
#                                                               _              
#                                                       _______| |__  _ __ ___ 
#                                                      |_  / __| '_ \| '__/ __|
#                                                       / /\__ \ | | | | | (__ 
#                                                      /___|___/_| |_|_|  \___|
#
###############################################################################################################################

#Alias's are 140 lines down.

sysType=$(uname -n)

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors

if [ "$sysType" != "archbox" ]; then
    export PS1Color="red"
else
    export PS1Color="green"
fi
    
PROMPT="%B%F{green}%n%f%b%B%F{$PS1Color}@%f%b%B%F{$PS1Color}%M%f%b%B%F{white}:%f%b%B%F{blue}%~%f%b%B$%b%B %b"


setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=9999999
SAVEHIST=9999999
HISTFILE=~/.config/zsh/history

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char


# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

bindkey -s '^c' 'bc -lq\n'

bindkey -s '^f' ' cd "$(dirname "$(fzf)")"\n'
bindkey -s '^s' ' mmpv "$(fzf)"\n'
bindkey -s '^n' ' mpv "$(fzf)"\n'
bindkey -s '^[n' ' newsboat\n'
bindkey -s '^[e' ' neomutt\n'
bindkey -s '^[b' ' lynx 192.168.1.88:8080 \n'
bindkey -s '^[v' ' vim\n'
bindkey -s '^[f' ' ncdu -r\n'
bindkey -s '^[t' ' $sysmon\n'
bindkey -s '^[g' ' esv\n'
bindkey -s '^[m' ' cd ~/Music/ ; mmpv "$(fzf)"\n'
bindkey -s '^[d' ' $priv_esc !!\n'
bindkey -s '^[i' ' sxiv '
bindkey -s '^[p' ' mpv '

bindkey -s '^[1' ' cd ~/hoi4/modifications-2/ ; clear ; ls \n'
bindkey -s '^[2' ' cd ~/udemy/git ; clear ; ls \n'
bindkey -s '^[3' ' cd ~/suckless/dwm/ ; $editor config.h \n'
bindkey -s '^[4' ' cd ~/git_repos ; clear; \n'
bindkey -s '^[w' ' clear ; curl wttr.in \n'
bindkey -s '^[r' ' $editor ~/.config/zsh/.zshrc \n'

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#PLUGINS
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null
source ~/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source ~/.config/zsh/plugins/dirhistory/dirhistory.plugin.zsh 2>/dev/null
source ~/.config/zsh/plugins/jsontools/jsontools.plugin.zsh 2>/dev/null





##########################################ALIASES######################################################

#Alias Section
if [ -f ~/.config/zsh/.zsh_aliases ]; then
    . ~/.config/zsh/.zsh_aliases
fi

alias ls='ls --color=auto'

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


alias cl="clear"

#BASH IMPORT


#Alias Variables
editor=vim
browser=qutebrowser
priv_esc=doas
sysmon=btop
ytdl="noglob yt-dlp"
ytdlformat="22"
gui_file_manager=pcmanfm
tui_file_manager=lf


#noglob fixes
alias mpv="noglob mpv"
alias links="noglob links"
alias elinks="noglob elinks"
alias wget="noglob wget"
alias curl="noglob curl"
  
export EDITOR=$editor
export BROWSER=$browser
  

###Misc Aliases###
alias sudo="$priv_esc"
alias doas="$priv_esc"
alias vi="$editor"

alias ls="ls -trAsh --color=auto"
alias ll="ls -trAshl"
alias mv="mv -vi"
alias cp="cp -rvia"
alias sl="echo 'TYPO ALERT TYPE LS!'"
alias py="python3"
alias cl="clear"
alias mmpv="mpv --no-video"
alias br="$editor ~/.config/zsh/.zshrc"
alias bh="$editor ~/.config/zsh/history"
alias sv="$priv_esc $editor"
alias dv="$priv_esc $editor"
alias pg="ping google.com"
alias un="unlink"
alias his="cat ~/.config/zsh/history"

#Lynx Aliases
alias lynx="lynx -useragent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.79 Safari/537.1'"
alias lx="lynx -useragent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.79 Safari/537.1'"

#GIT ALIASES
alias g="git clone"
alias gtl="git log"
alias gtc="git commit -m"
alias gta="git add"
alias gts="git status"
alias gtp="git push"

setopt NO_NOMATCH
#set -o noglob
export COLORTERM=truecolor
setopt HIST_IGNORE_SPACE
