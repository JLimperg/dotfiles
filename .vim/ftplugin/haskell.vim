setlocal omnifunc=necoghc#omnifunc

noremap <silent> <Leader><Leader>t :GhcModType<CR>
noremap <silent> <Leader><Leader>e :GhcModExpand<CR>

nnoremap <silent> <Leader><Leader>c :GhcModCheck<CR>
nnoremap <silent> <Leader><Leader>l :GhcModLint<CR>
