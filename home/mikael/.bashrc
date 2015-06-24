#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LS_COLORS='Gxfxcxdxbxegedabagacad'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias nano='nano -w'
alias diff='colordiff'
alias chromium='chromium --disk-cache-dir=/tmp/cache'
alias skype='xhost +local: && sudo -u skype /usr/bin/skype'
alias wifi='sudo wifi-menu'
alias home='sudo netctl start wlan0-lofjard-50'
alias iphone='sudo netctl start wlan0-Mikaels\ iPhone'
alias spot='sudo netctl start wlan0-lofjard-spot'
alias b='/home/mikael/scripts/brightness.sh'
alias torrent='transmission-remote-cli -c ibs'
alias plexscan='curl http://nas:32400/library/sections/all/refresh?deep=1'
alias cleantorrent='rm /home/mikael/Downloads/*.torrent'
alias pkgclean='paccache -r;paccache -ruk0'
alias hdmi='xrandr --addmode HDMI1 1920x1080 && xrandr --output HDMI1 --mode 1920x1080 --right-of eDP1'

complete -cf sudo

source /usr/share/git/completion/git-prompt.sh

#PS1='[\u@\h \W]\$ '
PS1='[\[\e[0;92m\]\u\[\e[0m\]@\h \[\e[0;93m\]\w\[\e[0m\]$(__git_ps1 " \[\e[0:94m\](%s)")\[\e[0m\]]$ '

man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}
