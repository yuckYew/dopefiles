""" dein related script """

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインを収めたTOMLファイル
  " 予めTOMLファイルを用意
  let g:rc_dir    = expand('~/dopefiles')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOMLを読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定完了
  call dein#end()
  call dein#save_state()
endif

" 未インストールのものがあればインストール
if dein#check_install()
  call dein#install()
endif

" setting
syntax on
filetype indent plugin on

" dein関連終わり---------------------------------------------------------------

" omnicompletion
set omnifunc=jedi#completions

colorscheme elflord

"文字コードをUTF-8に設定
set fenc=utf-8

""" 表示関係 """
set number		" 行数を表示
set cursorline		" カーソルのある行にhorizontal lineを表示
set wrap		" テキストの折り返し
set textwidth=0		" 自動改行を無効
set colorcolumn=80	" 80文字目にラインを入れる
set matchtime=3		" 3秒だけ対応括弧を表示


""" 検索関係 """
set ignorecase		" 大文字小文字を区別しない
set smartcase		" 検索文字に大文字がある場合、大文字小文字を区別
set incsearch		" incremental search. 一文字目から検索を始める
set hlsearch		" 検索文字列をハイライト


""" 編集関係 """
set showmatch		" 対応する括弧をハイライト
set shiftwidth=4	" インデント幅
set tabstop=4		" タブ幅
set expandtab		" tab to spaces
set smarttab		" shiftwidth instead of tabstop at start of lines
set softtabstop=4	" backspace deletes 4spaces(converted <TAB>)


""" マクロ&キー関係 """
imap jj <Esc>		" ESCをjjにマッピング
vnoremap v $h		" v2回で行末までvisual選択

" jk移動を折り返されたテキストでも自然にする
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>	gk

" ESC2回でハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" Ctrl + hjklでウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shft + arrowでウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>	   <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>


""" Misc """
" Swapファイル要らん
set nowritebackup
set nobackup
set noswapfile
