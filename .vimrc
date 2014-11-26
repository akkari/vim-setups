" pathogen config
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()


" keymap
" Toggle on/off NERDTree.
nnoremap <F1> :NERDTreeToggle<CR>
" Toggle on/off tagbar.
nnoremap <F2> :Tagbar<CR>
" Toggle on/off indent guides.
nnoremap <F3> :IndentGuidesToggle<CR>
" Check python code of current buffer.
nnoremap <F4> :PyLint<CR>
" Toggle on/off line number.
nnoremap <F5> :set nonumber!<CR>:set foldcolumn=0<CR>
" Tabs related
nmap tn :tabnew 
nmap <C-m> gt
nmap <C-n> gT
" Wrap a word with braces.
map <C-b> wbi(<ESC>ea)<ESC>
imap <C-b> <ESC>wbi(<ESC>ea)
" Clipboard-related operations.
map <C-p> "+p
map <C-y> "+y
map <C-x> "+d
" move between splited windows
map <c-h> <C-w>h
map <c-j> <C-w>j
map <c-k> <C-w>k
map <c-l> <C-w>l
map + <c-w>+
map _ <c-w>-
map - <c-w><
map = <c-w>>
map <c-c> :close<CR>
" Comment/uncomment the visually selected lines.
vmap # :s/^\(.\)/#\1/g<CR>
vmap ! :s/^\(.\)/!\1/g<CR>
vmap ## :s/^#//g<CR>
vmap !! :s/^!//g<CR>
nmap # :.s/^\(.\)/#\1/g<CR>
nmap ! :.s/^\(.\)/!\1/g<CR>
nmap ## :.s/^#//g<CR>
nmap !! :.s/^!//g<CR>
" Comment/uncomment the current line.
nmap # :.s/^\(.\)/#\1/g<CR>
nmap ! :.s/^\(.\)/!\1/g<CR>
nmap ## :.s/^#//g<CR>
nmap !! :.s/^!//g<CR>


set fileencodings=ucs-bom,utf-8,gb18030,gb2313,sjis,cp932,default,latin1
set nu
set autoindent
set showcmd
set incsearch
set ignorecase smartcase
set wrap
set guioptions+=b

" Appearance
if has ("gui_running")
	set background=dark
	colorscheme solarized
	set guifont=Droid\ Sans\ Mono\ 10
else
	"let g:solarized_termcolors=256
	"let g:solarized_termtrans=1
	set background=light
	"colorscheme solarized
endif

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
filetype plugin indent on
syntax on

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
let g:pymode_folding = 0
let g:pymode_indent = 0

" Supertab config
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose=1
let g:SuperTabLongestEnhanced=1

" Syntastic
let g:syntastic_check_on_wq=0
let g:syntastic_mode_map = { 'mode': 'passive','active_filetypes': ["python", "c"],'passive_filetypes': [] }
let g:syntastic_quiet_messages = { "level": "warnings",
   			         \ "type":  "style" }

" Fortran specific setting
let fortran_fold = 1
let fortran_do_enddo=1
autocmd FileType fortran setlocal foldmethod=syntax

" indent guides
if !has ("gui_running")
	let g:indent_guides_auto_colors = 0
	autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
	autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
endif
let g:indent_guides_guide_size = 1
"let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_soft_pattern = ' '

