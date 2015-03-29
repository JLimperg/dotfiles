source ~/.vimkeymap

" Plugins
execute pathogen#infect()

filetype plugin indent on
syntax on

let g:haddock_browser="/usr/bin/firefox"

" Esc mapping for insert
inoremap                 nr    <Esc>

noremap                  _     <C-]>
noremap                  <C-_> <C-t>

nnoremap                 <Space> <C-F>

noremap  <silent>        <Leader>w  :write<CR>
noremap  <silent>        <Leader>ww :write<CR>
noremap  <silent>        <Leader>q  :write<CR>:quit<CR>
noremap  <silent>        <Leader>Q  :quit!<CR>

noremap                  <Leader>fi :find
noremap                  <Leader>fh :sfind
noremap                  <Leader>fv :vertical :sfind

noremap <silent>         <Leader>sv :source ~/.vimrc<CR>

noremap <silent>         <Leader>sh :nohlsearch<CR>
noremap                  <Leader>su :s/\v

noremap <silent>         <Leader>ut :silent !ctags -R<CR> :redraw!<CR>

" Coq mode mappings
nnoremap <silent>        <Leader>gl :CoqLaunch<CR>:highlight CheckedByCoq ctermbg=253<CR>
nnoremap <silent>        <Leader>gk :CoqKill<CR>
nnoremap <silent>        <Leader>gc :CoqToCursor<CR>
nnoremap <silent>        <Leader>gn :CoqNext<CR>
nnoremap <silent>        <Leader>gu :CoqUndo<CR>
nnoremap                 <Leader>ge :Coq Eval compute in (
nnoremap                 <Leader>gs :Coq SearchAbout

" Visual markers mappings
imap <C-j> <Plug>MarkersJumpF
imap <C-ö> <Plug>MarkersJumpB

" Path
set path=.,,**
set suffixes+=.hi,.o,.dyn_hi,.dyn_o

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

" Ultisnip options
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

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
