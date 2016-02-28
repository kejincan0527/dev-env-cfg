set nocompatible

" Breeze's setting
" for Linux

set number
set nocp
set hls
set autoindent
set smartindent
set nocompatible
set autochdir
set smarttab
set noexpandtab		" use tabs, not spaces
set tabstop=8		" tabstops of 8
set shiftwidth=8	" indents of 8
set textwidth=78	" screen in 80 columns wide, wrap at 78
set backspace=indent,eol,start
set nocompatible	" Disable vi-compatibility
set laststatus=2	" Always show the statusline
set encoding=utf-8	" Necessary to show Unicode glyphs
set t_Co=256		" Explicitly tell Vim that the terminal supports 256 colors

" let Vundle manage Vundle
" " required!
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'ap/vim-css-color'
Bundle 'airblade/vim-gitgutter'
Bundle 'gcmt/wildfire.vim'
Bundle 'ianva/vim-youdao-translater'
Bundle 'DataWraith/auto_mkdir'
Bundle 'tpope/vim-rails'
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle 'funorpain/vim-cpplint'
Bundle 'taglist.vim'
Bundle 'scrooloose/syntastic'

filetype plugin indent on

colo slate
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab

let g:Powerline_symbols = 'unicode'

filetype off
syntax on

" map <esc>
imap jk <Esc>
set timeoutlen=500

let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
let g:winManagerWidth = 30

nmap <silent> <F3> :WMToggle<CR>
nnoremap <silent> <F8> :TlistToggle<CR>
let g:AutoOpenWinManager = 1

if has("win32")
set guifont=Consolas:h11
endif

" for ctags
noremap <C-T> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --if0=yes . <CR>

" for Youdao Dict
vnoremap <silent> <C-Y> <Esc>:Ydv<CR>
nnoremap <silent> <C-Y> <Esc>:Ydc<CR>
noremap yd :Yde<CR>

" for youcompleteme
let g:ycm_global_ycm_extra_conf = expand("~/.vim/.ycm_extra_conf.py")
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_seed_identifiers_with_syntax=1
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
let g:ycm_filetype_blacklist = {'tagbar' : 1,'qf' : 1,'notes' : 1,'unite' : 1,'vimwiki' : 1,}

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-K> :YcmCompleter GoToDefinitionElseDeclaration<CR>

" for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

fun! TrimWhitespace()
	let l:save_cursor = getpos('.')
	%s/\s\+$//e
	call setpos('.', l:save_cursor)
endfun

:noremap <C-L> :call TrimWhitespace()<CR>

map <C-n> :NERDTreeToggle<CR>

hi Comment ctermfg=green
