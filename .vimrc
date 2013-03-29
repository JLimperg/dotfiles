" Plugins
execute pathogen#infect()

filetype plugin indent on
syntax on

" Basic movement commands for German keyboard layout
noremap                  ö l
noremap                  l k
noremap                  k j
noremap                  j h
noremap                  t <C-]>

nnoremap                 <C-w>ö     <C-w>l
nnoremap                 <C-w>l     <C-w>k
nnoremap                 <C-w>k     <C-w>j
nnoremap                 <C-W>j     <C-W>h

nnoremap                 <C-W><C-ö> <C-W>l
nnoremap                 <C-W><C-l> <C-W>k
nnoremap                 <C-W><C-k> <C-W>j
nnoremap                 <C-W><C-j> <C-W>h

" Leader
:let mapleader = "-"

" Leader mappings
noremap  <silent>        <Leader>w :write<LF>
noremap  <silent>        <Leader>q :write<LF>:quit<LF>
noremap  <silent>        <Leader>h :new<LF>
noremap  <silent>        <Leader>v :vnew<LF>
noremap                  <Leader>fi :find 
noremap                  <Leader>fs :sfind 
noremap                  <Leader>fv :vertical :sfind 
noremap  <silent>        <Leader>sh :set hlsearch!<LF>

" Path
set path=.,,**

" Numerous helpful options
set number
set colorcolumn=80
set autoindent
set shiftwidth=2
set tabstop=2
set expandtab
set list listchars=tab:»·,trail:·
set equalalways

" line wrapping
nnoremap l gk
nnoremap k gj
vnoremap l gk
vnoremap k gj
set nowrap

" copy&paste
set clipboard=unnamed

" LaTeX
set shellslash
set grepprg=grep\ -nH\ $*
au BufEnter *.tex set autowrite

" Default output for latex is pdftex
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_GotoError = 0
let g:Tex_ViewRule_pdf = 'evince'

" NXC syntax highlighting
au BufNewFile,BufRead *.nxc set filetype=nxc

" To enable spell checking while typing, use ':set spell'
set spelllang=de

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

" Uncomment the following to strip trailing whitespace automatically when
" writing a buffer.

" autocmd FileWritePre * :call TrimWhiteSpace()
" autocmd FileAppendPre * :call TrimWhiteSpace()
" autocmd FilterWritePre * :call TrimWhiteSpace()
" autocmd BufWritePre * :call TrimWhiteSpace()

map  <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>
