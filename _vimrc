set nocompatible
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

" dein
" Vim起動完了時にインストール
augroup PluginInstall
  autocmd!
    autocmd VimEnter * if dein#check_install() | call dein#install() | endif
    augroup END

    " 各プラグインをインストールするディレクトリ
    let s:plugin_dir = expand('~/.vim/')

    " dein.vimをインストールするディレクトリをランタイムパスへ追加
    let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
    execute 'set runtimepath+=' . s:dein_dir

    " dein.vimがまだ入ってなければ 最初に git clone
    if !isdirectory(s:dein_dir)
          call mkdir(s:dein_dir, 'p')
            silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
            endif

            "dein plugin settings
            if dein#load_state(s:plugin_dir)
                  call dein#begin(s:plugin_dir)
                  endif

                  " ここからインストールするプラグイン
                  call dein#add('Shougo/dein.vim')
                  call dein#add('Shougo/neocomplcache.vim')
                  call dein#add('Shougo/neocomplcache-rsense.vim')


                  " neocomplcacheの設定
                  " Disable AutoComplPop.
                  let g:acp_enableAtStartup = 0

                  " Use neocomplcache.
                  let g:neocomplcache_enable_at_startup = 1

                  " Use smartcase.
                  let g:neocomplcache_enable_smart_case = 1

                  " Set minimum syntax keyword length.
                  let g:neocomplcache_min_syntax_length = 3
                  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

                  let g:neocomplcache_enable_camel_case_completion = 1
                  let g:neocomplcache_enable_underbar_completion = 1


                  " Rsense用の設定
                  if !exists('g:neocomplcache_omni_patterns')
                          let g:neocomplcache_omni_patterns = {}
                          endif
                          let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
                          autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

                          "rsenseのインストールフォルダがデフォルトと異なるので設定
                          let g:rsenseHome = expand("/usr/local/bin/rsense")
                          let g:rsenseUseOmniFunc = 1

" -------------------------------
" NeoBundle
" -------------------------------
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

" 自動で閉じる
NeoBundle 'tpope/vim-endwise'

" コメントアウトを楽にするプラグイン
NeoBundle "tyru/caw.vim.git"
"caw:hatpos:toggle
nmap <C-K> <Plug>(caw:hatpos:toggle)
vmap <C-K> <Plug>(caw:hatpos:toggle)

" ファイルをツリー表示
NeoBundle "scrooloose/nerdtree"
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" インデントの可視化
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
"let g:indentLine_char = '' "use ¦, ┆ or │

" slimにカラーをつける
NeoBundle "slim-template/vim-slim"

" タグバー、ファイルないのメソッド一覧を出してくれる
NeoBundleLazy "majutsushi/tagbar", {
      \ "autoload": { "commands": ["TagbarToggle"] }}
if ! empty(neobundle#get("tagbar"))
   " Width (default 40)
  let g:tagbar_width = 20
  " Map for toggle
  nn <silent> <leader>t :TagbarToggle<CR>
endif

call neobundle#end()

NeoBundleCheck

" ファイル形式の検出の有効化する
" ファイル形式別プラグインのロードを有効化する
" ファイル形式別インデントのロードを有効化する
filetype plugin indent on

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
