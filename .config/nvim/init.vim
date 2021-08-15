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
set noshowmode
set laststatus=0

let mapleader =","
imap jk <Esc>

" Perform dot commands over visual blocks:
vnoremap . :normal .<CR>

" Function for toggling the bottom statusbar
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set laststatus=0
    else
        let s:hidden_all = 0
        set showmode
        set laststatus=2
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

" Nerd tree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
if has('nvim')
	let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
endif

"Source init.vim on save
autocmd BufWritePost ~/.config/nvim/init.vim source %

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %

" Recompile dwmblocks on config edit.
" autocmd BufWritePost ~/.local/src/dwmblocks/blocks.def.h !cd ~/.local/src/dwmblocks/; sudo make clean install && { killall -q dwmblocks;setsid -f dwmblocks }

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif
