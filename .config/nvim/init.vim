if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" PlugInstall,PlugUpdate,PlugClean
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'preservim/nerdtree'
Plug 'lilydjwg/colorizer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

""""""""""""""""""""""""""""""""
"Settings
""""""""""""""""""""""""""""""""
set clipboard+=unnamedplus
set number relativenumber
set mouse=a
set ignorecase
set smartcase
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set wildmode=longest,list,full
set splitbelow splitright
set spelllang=en,cjk
set spellsuggest=best,9

""""""""""""""""""""""""""""""""
"Key Mappings
""""""""""""""""""""""""""""""""
let mapleader = " "
nnoremap <A-v> :wincmd v<CR>
nnoremap <A-s> :wincmd s<CR>
nnoremap <A-t> :tabnew<CR>
map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l
nnoremap <A-p> :tabp<CR>
nnoremap <A-n> :tabn<CR>
nnoremap <A-+> :vertical resize +5<CR>
nnoremap <A--> :vertical resize -5<CR>
nnoremap <leader>q :wq<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>S :%s//g<Left><Left>
" Perform dot commands over visual blocks:
vnoremap . :normal .<CR>
" Indenting visual block doesn't go out of visual block
vmap < <gv
vmap > >gv
" Spell Checking
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

""""""""""""""""""""""""""""""""
"File save actions
""""""""""""""""""""""""""""""""
" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
" Source nvim config
autocmd BufWritePost ~/.config/nvim/init.vim so %
" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost ~/.config/x11/xresources !xrdb %
" Recompile dwmblocks on config edit.
autocmd BufWritePost ~/.local/src/dwmblocks/blocks.def.h !cd ~/.local/src/dwmblocks/; sudo make clean install && { killall -q dwmblocks;setsid -f dwmblocks }


""""""""""""""""""""""""""""""""
" Plugin Configs
""""""""""""""""""""""""""""""""
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/tokyonight.vim
