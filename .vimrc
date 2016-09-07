
"文字化け対策
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" backspaceを効かせる
set backspace=indent,eol,start

" マウスの利用
set mouse=a
" マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
set nomousefocus
" 入力時にマウスポインタを隠す (nomousehide:隠さない)
set mousehide

"Syntax
syntax enable

"Use clipboard of OS
set clipboard+=unnamed
set clipboard=unnamed

" 最後まで検索したら先頭に戻る
set wrapscan


"-------------------------------------------------
" Editor エディター設定
"-------------------------------------------------
" 行番号を表示する。
set number

" 閉じ括弧が入力されたとき、対応する開き括弧にわずかの間ジャンプする
set showmatch

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//e

set showmode
set title
set titlestring=vim
set ruler
set showcmd
set showmatch
set laststatus=2

"-------------------------------------------------
" Indent インデント設定
"-------------------------------------------------

" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent

" 新しい行を作ったときに高度な自動インデントを行う
set smartindent

" <Tab> が対応する空白の数。
set tabstop=4

" <Tab> の挿入や <BS> の使用等の編集操作をするときに、<Tab> が対応する空白の数。
set softtabstop=4

" インデントの各段階に使われる空白の数
set shiftwidth=4

" Insertモードで <Tab> を挿入するとき、代わりに適切な数の空白を使う。（有効:expandtab/無効:noexpandtab）
set noexpandtab

" Insertモードで <Tab> を挿入するのに、適切な数の空白を使う
set expandtab

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

"-------------------------------------------------
" Search 検索設定
"-------------------------------------------------

" 検索コマンドを打ち込んでいる間にも、打ち込んだところまでのパターンがマッチするテキストを、すぐに表示する
set incsearch

"-------------------------------------------------
" Completion 補完設定
"-------------------------------------------------

"補完候補を表示する
set wildmenu

"補完モード
" ""              最初のマッチのみを補完する。
" "full"          次のマッチを完全に補完する。最後のマッチの次には元の文字列が使われ、その次は再び最初のマッチが補完される
" "longest"       共通する最長の文字列までが補完される。それ以上長い文字列を補完できないときは、次の候補に移る
" "longest:full"  "longest" と似ているが、'wildmenu' が有効ならばそれを開始する
" "list"          複数のマッチがあるときは、全てのマッチを羅列する。
" "list:full"     複数のマッチがあるときは、全てのマッチを羅列し、最初のマッチを補完する
" "list:longest"  複数のマッチがあるときは、全てのマッチを羅列し、共通する最長の文字列までが補完される
set wildmode=list:longest,full

"------------------------------------------------
"Vundle設定ファイル
"-----------------------------------------------

filetype off " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-vividchalk'
Bundle 'scrooloose/nerdcommenter'
Bundle 'nginx.vim'
Bundle 'php.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'css_color.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'kannokanno/previm'
Bundle 'tyru/open-browser.vim'

filetype plugin indent on

"------------------------------------------------
"NERDtree設定ファイル
"----------------------------------------------

let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle
nmap ,a <Plug>NERDCommenterAppend
vmap ,p <Plug>NERDCommenterSexy

let g:Powerline_symbols = 'fancy'

" FuzzyFinder
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_keyOpenSplit = '<CR>'


nnoremap <silent> ff :<C-u>FufFile!<C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
nnoremap <silent> fb :<C-u>FufBuffer!<CR>
nnoremap <silent> fm :<C-u>FufMruFile!<CR>

augroup FufAutoCommand
  autocmd!
    autocmd FileType fuf :imap <buffer> <Tab>   <C-n><C-@>
      autocmd FileType fuf :imap <buffer> <S-Tab> <C-p><C-@>
      augroup END
"------------------------------------------------
"Neobundle設定ファイル
"----------------------------------------------

"Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

filetype off

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 't9md/vim-textmanip'
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tomasr/molokai'

NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'

"NeoBundle 'https://bitbucket.org/kovisoft/slimv'

call neobundle#end()

filetype plugin indent on     " required!
filetype indent on
syntax on

NeoBundleCheck


"neocomplete

highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4

" 補完ウィンドウの設定
set completeopt=menuone

" 補完ウィンドウの設定
set completeopt=menuone

" rsenseでの自動補完機能を有効化
let g:rsenseUseOmniFunc = 1
" let g:rsenseHome = '/usr/local/lib/rsense-0.3'

" auto-ctagsを使ってファイル保存時にtagsファイルを更新
let g:auto_ctags = 1

" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1

" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_enable_camel_case_completion  =  1

" 最初の補完候補を選択状態にする
let g:neocomplcache_enable_auto_select = 1

" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20

" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3

" 補完の設定
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" 隠しファイルをデフォルトで表示させる
 let NERDTreeShowHidden = 1

 " デフォルトでツリーを表示させる
 autocmd VimEnter * execute 'NERDTree'
