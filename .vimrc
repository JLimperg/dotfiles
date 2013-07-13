" Plugins
execute pathogen#infect()

filetype plugin indent on
syntax on

let g:haddock_browser="/usr/bin/firefox"

" Esc mapping for insert
inoremap                 jk    <Esc>
" inoremap                 <Esc> <nop>

" Basic movement commands for German keyboard layout
noremap                  ö l
noremap                  l k
noremap                  k j
noremap                  j h
noremap                  _     <C-]>
noremap                  <C-_> <C-t>

nnoremap                 <C-w>ö     <C-w>l
nnoremap                 <C-w>l     <C-w>k
nnoremap                 <C-w>k     <C-w>j
nnoremap                 <C-W>j     <C-W>h

nnoremap                 <C-W><C-ö> <C-W>l
nnoremap                 <C-W><C-l> <C-W>k
nnoremap                 <C-W><C-k> <C-W>j
nnoremap                 <C-W><C-j> <C-W>h

nnoremap                 <C-w>Ö     <C-w>L
nnoremap                 <C-w>L     <C-w>K
nnoremap                 <C-w>K     <C-w>J
nnoremap                 <C-W>J     <C-W>H

nnoremap                 J ^
nnoremap                 Ö $

nnoremap                 <Space> <C-F>

" Various mappings
nnoremap                 -     <C-X>
nnoremap                 +     <C-A>
nnoremap                 <C-C> :call JCommentWriter()<CR>

" Leader mappings
:let mapleader = "h"

noremap  <silent>        <Leader>w  :write<CR>
noremap  <silent>        <Leader>ww :write<CR>
noremap  <silent>        <Leader>q  :write<CR>:quit<CR>
noremap  <silent>        <Leader>Q  :quit!<CR>

noremap  <silent>        <Leader>h  :new<CR>
noremap  <silent>        <Leader>v  :vnew<CR>
noremap                  <Leader>fi :find
noremap                  <Leader>fh :sfind
noremap                  <Leader>fv :vertical :sfind

noremap <silent>         <Leader>sv :source ~/.vimrc<CR>

noremap <silent>         <Leader>sh :nohlsearch<CR>
noremap                  <Leader>su :s/\v

" Path
set path=.,,**

" General Options
set number
set colorcolumn=80
set autoindent
set shiftwidth=2
set tabstop=2
set expandtab
set list listchars=tab:»·,trail:·
set equalalways
set hlsearch
set spelllang=de
set clipboard=unnamed

" Line wrapping
nnoremap l gk
nnoremap k gj
vnoremap l gk
vnoremap k gj
set nowrap


" LaTeX
set shellslash
set grepprg=grep\ -nH\ $*
au BufEnter *.tex set autowrite

" Custom LaTeX mappings
let g:Tex_Env_eqnarray = "\\begin{eqnarray*}\<CR><++>\<CR>\\end{eqnarray*}"

" Default output for latex is pdftex
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_GotoError = 0
let g:Tex_ViewRule_pdf = 'mupdf'
