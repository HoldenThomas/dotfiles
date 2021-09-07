if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" PlugInstall,PlugUpdate,PlugClean
call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'lilydjwg/colorizer'
call plug#end()

set mouse=a
set clipboard+=unnamedplus
set number relativenumber
set nohlsearch
set ignorecase
set smartcase

let mapleader =","
"imap jk <Esc>

" Perform dot commands over visual blocks:
vnoremap . :normal .<CR>

" Nerd tree
map <leader>n :NERDTreeToggle<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e

" Source nvim config
autocmd BufWritePost ~/.config/nvim/init.vim so %
" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost ~/.config/x11/xresources !xrdb %
" Recompile dwmblocks on config edit.
autocmd BufWritePost ~/.local/src/dwmblocks/blocks.def.h !cd ~/.local/src/dwmblocks/; sudo make clean install && { killall -q dwmblocks;setsid -f dwmblocks }
