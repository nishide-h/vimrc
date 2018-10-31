"set nocompatible
set directory=>~/tmp
set backupdir=>~/tmp
set clipboard+=unnamed
set number
set hidden
set incsearch
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set smartindent
set list
set listchars=eol:$,tab:>\ ,extends:<
set whichwrap=b,s,h,l,<,>,[,]
set showmatch
set smartcase
set nowrapscan
set clipboard=unnamed,autoselect
set colorcolumn=80

" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" 全角文字専用の設定
set ambiwidth=double
" wildmenuオプションを有効(vimバーからファイルを選択できる)
set wildmenu
"-----------------------------------------------------------------------------
" 検索
"-----------------------------------------------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" 検索結果をハイライト表示
set hlsearch

"----------------------------------------
" 表示設定
"----------------------------------------
" メッセージ表示欄を２行確保
set cmdheight=2
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
" 省略されずに表示
set display=lastline
" yでコピーした時にクリップボードに入る
set guioptions+=a
" スワップファイルを作成しない
set noswapfile
" 検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable
" タイトルを表示
set title
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

" Color Scheme
syntax enable
set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme hybrid
hi LineNr ctermbg=0 ctermfg=0
hi CursorLineNr ctermbg=4 ctermfg=0
set cursorline
hi clear CursorLine

" プラグイン管理をplug.vimで行う
" https://github.com/junegunn/vim-plug
" 以下のコマンドをコンソールで実行し、プラグイン本体をautoloadフォルダへ入れる
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
  " ファイルをツリー表示
  Plug 'scrooloose/nerdtree'
  nnoremap <silent><C-e> :NERDTreeToggle<CR>
  " 自動で閉じる
  Plug 'tpope/vim-endwise'
  " コメントアウトを楽にするプラグイン
  Plug 'tyru/caw.vim'
  nmap <C-K> <Plug>(caw:hatpos:toggle)
  vmap <C-K> <Plug>(caw:hatpos:toggle)
  " インデントの可視化
  Plug 'Yggdroot/indentLine'
  let g:indentLine_color_term = 111
  let g:indentLine_color_gui = '#708090'
  " let g:indentLine_char = '' "use ¦, ┆ or │
  " slimにカラーをつける
  Plug 'slim-template/vim-slim'
  " タグバー、ファイルないのメソッド一覧を出してくれる
  Plug 'majutsushi/tagbar'
  let g:tagbar_width = 40
  nn <silent> <leader>t :TagbarToggle<CR>
call plug#end()

" ファイル形式の検出の有効化する
" ファイル形式別プラグインのロードを有効化する
" ファイル形式別インデントのロードを有効化する
filetype plugin indent on

" ノーマルモードへのショートカット
inoremap <silent> jj <ESC>

" windowショートカット
" http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif
