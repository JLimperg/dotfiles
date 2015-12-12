source ~/.vimkeymap

" Plugins
execute pathogen#infect()

filetype plugin indent on
syntax on

" Esc mapping for insert
inoremap                 nr    <Esc>

noremap                  _     <C-]>
noremap                  <C-_> <C-t>

noremap  <silent>        <Leader>w  :write<CR>
noremap  <silent>        <Leader>q  :quit!<CR>

noremap                  <Leader>fi :find
noremap                  <Leader>fh :sfind
noremap                  <Leader>fv :vertical :sfind

noremap <silent>         <Leader>sv :source ~/.vimrc<CR>

noremap <silent>         <Leader>sh :nohlsearch<CR>
noremap                  <Leader>su :s/\v

noremap <silent>         <Leader>ut :silent !ctags -R<CR> :redraw!<CR>

" Visual markers mappings
imap <C-j> <Plug>MarkersJumpF
imap <C-ö> <Plug>MarkersJumpB

" Path
set path=.,,**
set suffixes+=.hi,.o,.dyn_hi,.dyn_o,.glob,.vo,.vi,.d

" General Options
set autoindent
set autowrite
set clipboard=unnamed
set colorcolumn=80
set expandtab
set equalalways
set hlsearch
set list listchars=tab:»·,trail:·
set nojoinspaces
set shiftwidth=2
set spelllang=de
set tabstop=2
set modeline

setglobal relativenumber
set       relativenumber

set nowrap

" Color scheme
highlight SpecialKey ctermfg=grey

" Completion
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" UltiSnips integrates with neocompletion, so <Tab> now doubles
" as the omnicompletion key.

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
