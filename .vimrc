"############### Plugins #########################

set nocompatible " disables old vi commands
filetype off

call plug#begin()
Plug 'https://github.com/tpope/vim-rails.git'
Plug 'chriskempson/base16-vim'
Plug 'https://github.com/vim-ruby/vim-ruby.git'
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-syntastic/syntastic'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'elixir-editors/vim-elixir'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme base16-solarized-dark
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set laststatus=2
filetype plugin on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"########## Commands run on startup ################

set clipboard=unnamed	" maybe this will make compatible clipboards?

set wildmenu " visual autocomplete for searches	

let $BASH_ENV="~/.vim/vim_bash" " make vim bash and bash profile aliases work together

set path+=** " allows a file search to find patterns.  E.G. *_spec.rb to find all files matching that pattern in the project 

set relativenumber " adds changing numbers to the left side of the screen

set number! " shows you the line you are on

set tabstop=2 " creates a more reasonable tab size for clean code

syntax enable " changes colors of classes, parens, etc...

"###################### Remaps and snippits #############################

let mapleader = "\<Space>"

nnoremap <leader>sp :0r ~/.vim/.skeleton_rspec_test.rb <Return> gg 0 2j e ci"
nnoremap <leader>ct :0r ~/.vim/.skeleton_controller.rb <Return>
nnoremap <leader>cl :0r ~/.vim/.skeleton_class.rb <Return>
nnoremap <leader>mod :0r ~/.vim/.skeleton_model.rb <Return> gg 0 w caw
nnoremap <leader>def :r ~/.vim/.skeleton_method.rb <Return>
