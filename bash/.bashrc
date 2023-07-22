# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# Aliases
alias ls="exa -g"
alias ll="exa -gl"
alias la="exa -gla"

alias vim="nvim"

alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gr='git rm'
alias gl='git log'

alias ip="ip -c"

alias tree="exa --tree --level=2 --git-ignore"
alias treee="exa --tree --level=3 --git-ignore"
alias treeee="exa --tree --level=4 --git-ignore"
alias treeeee="exa --tree --level=5 --git-ignore"

alias belp="bat --language help --style plain" # Requires bat
function bman() {
	man "$1" | bat --language Manpage --style plain
}

#Lists URLs that start with 'http' or 'https' on a webpage using cURL
#
#    Usage: listurls https://example.org
#
function listurls() { curl -s -f -L "$1" | grep -Eo '"(http|https)://[a-zA-Z0-9#~.*,/!?=+&_%:-]*"' | sed 's/"//g' ; }

# Starship
eval "$(starship init bash)"
