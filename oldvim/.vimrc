"############### Plugins #########################

set nocompatible " disables old vi commands
filetype off

let mapleader = "\<Space>"

"################## Commentary commands
noremap \ :Commentary<CR>
autocmd FileType ruby setlocal commentstring=#\ %s

"########## Commands run on startup ################
set wildmenu " visual autocomplete for searches	

let $BASH_ENV="~/.vim/vim_bash" " make vim bash and bash profile aliases work together

set path+=** " allows a file search to find patterns.  E.G. *_spec.rb to find all files matching that pattern in the project 

set relativenumber " adds changing numbers to the left side of the screen

set number! " shows you the line you are on

set tabstop=2 " creates a more reasonable tab size for clean code

syntax enable " changes colors of classes, parens, etc...
