# Dotfiles for my Arch System
Clone into home dir using bare repository:
```
mkdir ~/.dotfiles
git clone --bare https://github.com/holdenthomas/dotfiles ~/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config status.showUntrackedFiles no
```

Add an alias to shell rc for shortening git command:
```
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
