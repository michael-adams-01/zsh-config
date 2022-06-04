alias cl="clear"

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

alias nm="neomutt"
alias clls="clear ; ls"
alias lf="lfub"
alias ab="abduco"
alias aba="abduco -A"
alias fd="fd -H"

