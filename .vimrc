" +--- plugin settings ---+

" dein.vim
" -------------------------------------------------------------------------
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/unite.vim')
call dein#add('fukayatsu/vim-diary')
call dein#add('justinmk/vim-sneak')
call dein#add('vim-jp/vimdoc-ja')
call dein#add('bling/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('ujihisa/neco-look')
call dein#add('scrooloose/nerdcommenter')
call dein#add('plasticboy/vim-markdown')
call dein#add('scrooloose/nerdtree')
call dein#add('arcticicestudio/nord-vim')
call dein#add('ryanoasis/vim-devicons')
call dein#add('fatih/vim-go')
call dein#end()

" neocomplete.vim
" -------------------------------------------------------------------------
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" java code complete.
let g:neocomplete#sources#omni#input_patterns.java = '\h\w*\.\w*'
" ruby code complete.
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" vim-sneak
" -------------------------------------------------------------------------
let g:sneak#label = 1

" Airline
" -------------------------------------------------------------------------
set laststatus=2 " statusline with one file
let g:airline#extensions#tabline#enabled = 1 " top bar
let g:airline#extensions#tabline#fnamemod = ':t' " just show filename
" let g:airline#extensions#syntastic#enabled = 1
let g:airline_theme = "zenburn"
let g:airline_left_sep = '' " Straight separator
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" neco-look
" -------------------------------------------------------------------------
if !exists('g:neocomplete#text_mode_filetypes')
  let g:neocomplete#text_mode_filetypes = {}
endif
let g:neocomplete#text_mode_filetypes = { "_" : 1 }

" vim-go
" -------------------------------------------------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
" err????????????????????????highlight?????????
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/
" go???????????????????????????????????????????????????
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" NERDTree
" -------------------------------------------------------------------------
" NERDTree?????????????????????????????????????????????????????????
let NERDTreeShowHidden = 1
" ????????????????????????????????????????????????NERDTree?????????????????????????????????????????????
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" +--- vim settings ---+
" vim settings
" -------------------------------------------------------------------------
" SETTINGS
" transrate vim documentation to japanese
set helplang=ja,en
" encoding
set fenc=utf-8
" don't make backup file
set nobackup
set noswapfile
" autoread
set autoread
set showcmd
" auto complete
set wildmode=list:longest
" return
nmap <CR> i<CR><ESC>
" leader???????????????
let mapleader = ","
" ,?????????????????????????????????\???????????????????????????
noremap \  ,
" enable backspace key to delete words
set backspace=indent,eol,start
" ??????????????????????????????
set clipboard+=unnamed,autoselect

" DISPLAY
" show line number
set number
" cursor hilighting
set cursorline
" indent
set smartindent
set autoindent
" ?????????????????????????????????????????????
se mouse+=a
" color scheme
augroup nord-overrides
  autocmd!
  autocmd ColorScheme nord highlight Comment ctermfg=14
augroup END
colorscheme nord
syntax on

" TAB
" show invisible tab
" set list listchars=tab:\???\-
" set expandtab

" SEARCH
" expect upper case ignore case's different
set ignorecase
set smartcase
" incremental search
set incsearch
" reincarnation
set wrapscan
" result highlighting
set hlsearch

" ?????????????????????????????????
nnoremap <LEFT> <NOP>
nnoremap <RIGHT> <NOP>
nnoremap <UP> <NOP>
nnoremap <DOWN> <NOP>

inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>

" NERDTree??????
let file_name = expand('%')
" ???????????????????????????????????????????????????????????????
if has('vim_starting') &&  file_name == ''
  autocmd VimEnter * NERDTree 
else
" ?????????????????????????????????????????????????????????????????????????????????
  autocmd VimEnter * NERDTree | wincmd p 
endif
