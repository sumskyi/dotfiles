set nocompatible

filetype off

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""Vundle begin
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" github:
" Bundle 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'vim-scripts/apidock.vim'
Plugin 'lucapette/vim-ruby-doc'
Plugin 'gregsexton/gitv'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'skwp/vim-colors-solarized'
"Plugin 'spllr/vim-padrino'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-projectionist'
"Bundle 'tpope/vim-dispatch'

Plugin 'vim-ruby/vim-ruby'

Plugin 'bling/vim-airline'

" vimscripts repos
Plugin 'bufexplorer.zip'
Plugin 'Colour-Sampler-Pack'
Plugin 'taglist.vim'
Plugin 'L9'
Plugin 'ctrlp.vim'
Plugin 'matchit.zip'
Plugin 'Tagbar'

Plugin 'dr-chip-vim-scripts/ZoomWin'

Plugin 'Shougo/neocomplete'



" syntax
Plugin 'derekwyatt/vim-scala'
Plugin 'wlangstroth/vim-racket'
Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'slim-template/vim-slim'
Plugin 'ElmCast/elm-vim'

" typescript
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'

" Ember
Plugin 'AndrewRadev/ember_tools.vim'
Plugin 'joukevandermaas/vim-ember-hbs'



" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""Vundle end

syntax on " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

set ruler

set laststatus=2

"turn off needless toolbar on gvim/mvim
"set guioptions-=T

set autoindent

set gfn=Misc\ Fixed\ 11

if has("gui_running")
    set background=dark
    colorscheme solarized
else
    colorscheme relaxedgreen
endif

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
"set tabstop=4
"set smarttab

":autocmd FileType yaml set expandtab ts=2 sw=2
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType php set omnifunc=phpcomplete#CompletePHP shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType javascript set shiftwidth=4 softtabstop=4 tabstop=4 smarttab

au BufNewFile,BufRead *.es6 set filetype=javascript
au BufNewFile,BufRead *.rabl set filetype=ruby
au BufNewFile,BufRead *.yajl set filetype=ruby
"au BufNewFile,BufRead *.rb setlocal filetype=ruby-rails.ruby syntax=ruby
au BufNewFile,BufRead *_spec.rb setlocal filetype=ruby-rspec.ruby syntax=ruby
"au BufNewFile,BufRead *_spec.rb setlocal filetype=ruby-rspec syntax=ruby
au BufNewFile,BufRead *.hamljs set filetype=haml

:se nu
":se relativenumber

set modeline
set modelines=5


set ignorecase
set smartcase
set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>


map <C-A> <C-W>_

nnoremap <c-p> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
nmap <F8> :TagbarToggle<CR>
nmap <F9> :NeoCompleteToggle<CR>

"let g:golden_ratio_autocommand = 0
"nnoremap <F7> :GoldenRatioToggle<CR>

let g:ctrlp_map = '<c-f>'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|vendor$'

" let g:neocomplete#enable_at_startup = 1
call neocomplete#util#set_default_dictionary(
  \ 'g:neocomplete#sources#omni#input_patterns',
  \ 'elm',
  \ '\.')

nnoremap <c-f> :CtrlP<CR>
nnoremap <c-b> :CtrlPBuffer<CR>
nnoremap <c-t> :CtrlPTag<CR>

lang en_US.UTF-8

set noerrorbells
set visualbell
set t_vb=

:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

let g:syntastic_enable_signs=1
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_coffee_coffeelint_args = "--csv --file ~/coffeelint.json"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1
"let g:rails_menu=1

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

set foldmethod=syntax
set nofoldenable

set colorcolumn=80,120

let g:ruby_doc_ruby_search_host='http://apidock.com/ruby/'

set backupdir=~/tmp,.
set directory=~/tmp,.

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif

if filereadable(expand("~/.vimrc.ocaml"))
  source ~/.vimrc.ocaml
endif

let g:UltiSnipsEditSplit="vertical"

let g:NERDSpaceDelims = 1
