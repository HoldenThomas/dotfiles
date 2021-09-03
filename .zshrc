# Enable colors and change prompt
autoload -U colors && colors	# Load colors
PS1="%{$fg[magenta]%}%~%{$reset_color%}>%b "

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.cache/zsh/.histfile

# Use $XINITRC variable if file exists.
[ -f "$XINITRC" ] && alias startx="startx $XINITRC"

# Use neovim for vim if present
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# sudo not required for some system commands
for command in mount umount pacman su ; do
	alias $command="sudo $command"
done; unset command

# Settings you always want
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	mkdir="mkdir -pv" \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ip="ip -color=auto"

# Shortening some common commands
alias \
	ll="ls -al" \
	C="cd" \
	p="pacman" \
	g="git" \
	v="vim" \
	sdn="shutdown now" \
	pm="pulsemixer" \
	bt="bluetoothctl" \
	nu="nmtui"

# Some other nice commands
alias \
	upMirrors="sudo reflector --verbose --latest 50 --sort rate --save /etc/pacman.d/mirrorlist" \
	yt="youtube-dl -o '%(title)s.%(ext)s'" \
	yt-fmp4="yt -f mp4" \
	yt-rmp4="yt --recode-video mp4" \
	yt-mmp4="yt --merge-output-format mp4" \
	screenShot="maim -s ~/Pictures/$(date +%s).png" \
	config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' \
	gts="c /run/media/$(whoami)/HDD8T/Sync"

# A nice way to cd around the terminal
c() {
      if [ -n "$1" ]; then
        cd "$1" || return 1
      else
        cd ..
      fi
      ls -a
}

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

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
bindkey -s '^a' 'bc -lq\n'
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

# Change ls colors for making ntfs mounted partitions readable
LS_COLORS='ow=1;35:'
export LS_COLORS

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
