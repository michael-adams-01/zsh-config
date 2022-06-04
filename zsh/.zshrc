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
#PS1="%B%{$fg[green]%}%n%{$fg[green]%}@%{$fg[green]%}%M$fg[white]:%{$fg[blue]%}%~%{$reset_color%}$%b "

if [ "$sysType" != "archbox" ]; then
    export PS1Color="red"
else
    export PS1Color="green"
fi
    
PROMPT="%B%F{green}%n%f%b%B%F{$PS1Color}@%f%b%B%F{$PS1Color}%M%f%b%B%F{white}:%f%b%B%F{blue}%~%f%b%B$%b%B %b"



# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# PS1="%B%{$fg[red]%}[%{$fg[green]%}%n%{$fg[green]%}@%{$fg[green]%}%M:%{$fg[blue]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
# PS1="%B%{$fg[red]%} [%{$fg[green]%}%n%{$fg[green]%}@%{$fg[green]%}%M$fg[white]:%{$fg[blue]%}%~%{$fg[red]%}] %{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=9999999
SAVEHIST=9999999
HISTFILE=~/.config/zsh/history

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
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

###
# Change cursor shape for different vi modes.
# function zle-keymap-select () {
#     case $KEYMAP in
#         vicmd) echo -ne '\e[1 q';;      # block
#         viins|main) echo -ne '\e[5 q';; # beam
#     esac
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
###

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
bindkey -s '^[2' ' cd ~/udemy/node/section_6/ ; clear ; ls \n'
bindkey -s '^[9' ' cd ~/suckless/dwm/ ; $editor config.h \n'
bindkey -s '^[3' ' cd ~/git_repos ; clear; \n'
bindkey -s '^[w' ' clear ; curl wttr.in \n'
bindkey -s '^[r' ' $editor ~/.config/zsh/.zshrc \n'

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load syntax highlighting; should be last.
 # source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
 # source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null

#PLUGINS
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null
source ~/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source ~/.config/zsh/plugins/dirhistory/dirhistory.plugin.zsh 2>/dev/null
#source ~/.config/zsh/plugins/copydir/copydir.plugin.zsh 2>/dev/null
source ~/.config/zsh/plugins/jsontools/jsontools.plugin.zsh 2>/dev/null




setopt NO_NOMATCH
export COLORTERM=truecolor
setopt HIST_IGNORE_SPACE

fpath=("$HOME/.config/zsh/prompts" "$fpath[@]")
source $HOME/.config/zsh/spaceship.zsh

##########################################ALIASES######################################################

#Alias Section
#if [ -f ~/.config/zsh/.zsh_aliases ]; then
#    . ~/.config/zsh/.zsh_aliases
#fi

if [ -f ~/.config/zsh/alias.zsh ]; then
    . ~/.config/zsh/alias.zsh
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

alias ls="ls -trAsh --color=auto"

##########################################END#OF#ALIASES###############################################



#alias config='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'


#export PATH=/home/michael/.local/bin:/home/michael/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/home/michael/.local/share/flatpak/exports/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

#setopt no_bare_glob_qual
#set -o noglob

#eval "$(starship init zsh)"

#pfetch
