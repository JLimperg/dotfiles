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
