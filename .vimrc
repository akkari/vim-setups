" pathogen config
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set nu
" Toggle on/off NERDTree.
nnoremap <F2> :NERDTreeToggle<CR>
" Toggle on/off taglist.
nnoremap <F3> :TlistToggle<CR>
" Check python code of current buffer.
nnoremap <F4> :PyLint<CR>
" Toggle on/off line number.
nnoremap <F5> :set nonumber!<CR>:set foldcolumn=0<CR>
" Tabs related
nmap tn :tabnew 
nmap <C-n> gt
nmap <C-n> gT
" Wrap a word with braces.
map <C-b> wbi(<ESC>ea)<ESC>
imap <C-b> <ESC>wbi(<ESC>ea)
" Clipboard-related operations.
map <C-p> "+p
map <C-y> "+y
map <C-d> "+d
" move around splited windows
map <c-h> <C-w>h
map <c-j> <C-w>j
map <c-k> <C-w>k
map <c-l> <C-w>l
map + <c-w>+
map _ <c-w>-
map - <c-w><
map = <c-w>>
map <c-c> :close<CR>

set fileencodings=ucs-bom,utf-8,gb18030,gb2313,sjis,cp932,default,latin1

set autoindent
set showcmd
set incsearch
set hlsearch
set ignorecase smartcase

" Template
"autocmd BufNewFile *.py 0r ~/.vim/template/skeleton.py
"autocmd BufNewFile *.sh 0r ~/.vim/template/skeleton.sh
augroup templates
  au!
  " read in template files
  autocmd BufNewFile *.* silent! execute '0r $HOME/.vim/template/skeleton.'.expand("<afile>:e")
 " parse special text in the templates after the read
  autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
augroup END

" Syntax highlight and auto-completion.
syntax on
filetype plugin indent on
" Python specific setting
autocmd FileType python setlocal expandtab smarttab shiftwidth=4 tabstop=4
autocmd FileType python setlocal foldmethod=indent
set foldlevel=99
au FileType python set omnifunc=pythoncomplete#Complete
" Python-mode
let g:pymode_rope = 0
let g:pymode_lint_write = 0
let g:pymode_lint_checker="pyflakes"
let g:pymode_motion = 0
" Supertab config
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose=1
let g:SuperTabLongestEnhanced=1
let g:pymode_folding = 0
let g:pymode_indent = 0
" Syntastic
let g:syntastic_check_on_wq=0
let g:syntastic_mode_map = { 'mode': 'passive','active_filetypes': [],'passive_filetypes': [] }

