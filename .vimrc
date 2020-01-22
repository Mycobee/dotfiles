"############### Plugins #########################

set nocompatible " disables old vi commands
filetype off

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/tpope/vim-rails.git'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'Shougo/neocomplete.vim'
Plug 'dense-analysis/ale'
Plug 'altercation/vim-colors-solarized'
call plug#end()

let mapleader = "\<Space>"

"################## Commentary commands
noremap \ :Commentary<CR>
autocmd FileType ruby setlocal commentstring=#\ %s

"######## Color Scheme stuffs
set background=dark
" solarized options, adjust per terminal
let g:solarized_visibility = "medium"
let g:solarized_contrast = "medium"
colorscheme solarized

" The below line is for macOS iterm with solarized in settings
let g:solarized_termcolors = 16

" Visit solarized plugin docs for 256 color options
" lightline display at bottom of screen
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
set laststatus=2
highlight ALEWarning ctermbg=16
filetype plugin on
filetype indent on
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"########## Commands run on startup ################
set wildmenu " visual autocomplete for searches	

let $BASH_ENV="~/.vim/vim_bash" " make vim bash and bash profile aliases work together

set path+=** " allows a file search to find patterns.  E.G. *_spec.rb to find all files matching that pattern in the project 

set relativenumber " adds changing numbers to the left side of the screen

set number! " shows you the line you are on

set tabstop=2 " creates a more reasonable tab size for clean code

"########## Copy out of and paste in to vim in iTerm2 with macOS
set clipboard=unnamed
nmap <leader>p :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
vmap <leader>y y:e ~/clipboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>
nmap <leader>y :.w !pbcopy<CR><CR>

syntax enable " changes colors of classes, parens, etc...

"###################### Remaps and snippits #############################


nnoremap <leader>sp :0r ~/.vim/.skeleton_rspec_test.rb <Return> gg 0 2j e ci"
nnoremap <leader>ct :0r ~/.vim/.skeleton_controller.rb <Return>
nnoremap <leader>cl :0r ~/.vim/.skeleton_class.rb <Return>
nnoremap <leader>mod :0r ~/.vim/.skeleton_model.rb <Return> gg 0 w caw
nnoremap <leader>def :r ~/.vim/.skeleton_method.rb <Return>
