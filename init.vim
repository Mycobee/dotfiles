"############### Plugins #########################

set nocompatible " disables old vi commands
filetype off

call plug#begin('~/.config/neovim/plugged')
  Plug 'https://github.com/tpope/vim-rails.git'
  Plug 'tpope/vim-commentary'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'jremmen/vim-ripgrep'
  Plug 'vim-ruby/vim-ruby'
  Plug 'Shougo/neocomplete.vim'
  Plug 'dense-analysis/ale'
  Plug 'altercation/vim-colors-solarized'
  Plug 'ngmy/vim-rubocop'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'preservim/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'honza/vim-snippets'
  Plug 'Pocco81/AutoSave.nvim'
call plug#end()
" figure out whitespace plugin

let mapleader = "\<Space>"

"################## FZF config
nnoremap <C-p> :GFiles<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

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
set statusline+=%#warningmsg#
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

"########## Rubocop config things

" let g:vimrubocop_config = '/path/to/rubocop.yml'
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

"########## Nerdtree

let g:NERDTreeShowHidden = 1 
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeIgnore = ['^node_modules$'] " ignore node_modules to increase load speed 
let g:NERDTreeStatusline = '' " set to empty to use lightline
" " Toggle
noremap <leader>vp :NERDTreeToggle<CR>
" " Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Map to open current file in NERDTree and set size
nnoremap <leader>pv :NERDTreeFind<bar> :vertical resize 45<CR>

" NERDTree Syntax Highlight
" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1 
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1 
" " Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
" " This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {} 
" " Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue 
" " This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {} 
" " Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange 
" " This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {} 
" " Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red 
" " Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige 
" " Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue 

" Neovim config
syntax enable " enable syntax highglighting
syntax on " turn on syntax highlighting
set undodir=~/.config/nvim/undodir " set undotree file directory
set undofile " set undotree to save to file
set nowrap " set no soft wrap
set tabstop=2 softtabstop=2 " set tab size
set shiftwidth=2 " affect amount of indentation
set expandtab " set that tab will insert softabstop amount of space characters
set nowritebackup " set to never save backup                                 
set noswapfile " set no swap file 
set nobackup " set no backup file
set breakindent " set every wrapped line will continue visually indented                    
set smartindent " set smart indentation
set smartcase " set to be cas sensitive when there is capital letter, this need set incsearch to work
set incsearch " set search to be case insensitive
set hidden
set updatetime=250
set shortmess+=c " for CoC plugin
set noshowmode " set that vim mode is hidden, to incorporate for lightline plugin
let mapleader=" "

" CoC config 
" :CocInstall coc-pairs
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" :CocInstall coc-json coc-css coc-html coc-prettier coc-solargraph coc-sql coc-snippets 
" gem install solargraph
"
"
"" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
