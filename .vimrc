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

" TrueColorに対応
set termguicolors

" [Mac] クリップボードの共有
set clipboard=unnamed

" omnicompletion
set omnifunc=jedi#completions

colorscheme solarized
"set background=dark

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
set expandtab		" tab to spaces
set smarttab		" shiftwidth instead of tabstop at start of lines
set backspace=indent,eol,start  " make the bs work like most other prgms

augroup indentByfileType
    "shiftwidth: indent length
    "tabstop: tab length
    "softtabstop: backspace deletes 4spaces(converted <TAB>)
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.tex setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

""" skeleton読むぜ """
augroup templates
    autocmd BufNewFile *.html 0r ./templates/skeleton.html
augroup END

""" マクロ&キー関係 """
imap jj <Esc>		" ESCをjjにマッピング
vmap <C-j> <Esc>    " v-mode ESCをCTRL+jにマッピング
vnoremap v $h		" v2回で行末までvisual選択

" jk移動を折り返されたテキストでも自然にする
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>	gk

" ESC2回でハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" Shft + arrowでウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>	   <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" [Deoplete] Change window color
highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#f9f9f9

" [Deoplete] Reverse the cycling direction of the completion candidates
let g:SuperTabContextDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-n>"

" For jedi-vim, disable docstring popup during completion
autocmd FileType python setlocal completeopt-=preview

" Open NerdTree with CTRL+E
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Split horizontally with ss
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>

" Moving in insertmode with CTRL+<arrow keys>
inoremap <C-h> <C-o><Left>
inoremap <C-j> <C-o><Down>
inoremap <C-k> <C-o><Up>
inoremap <C-l> <C-o><Right>
inoremap <C-w> <C-o>A

""" Misc """
" Swapファイル要らん
set nowritebackup
set nobackup
set noswapfile

" HTML files have 2 space for <TAB>
autocmd BufRead,BufNewFile *.htm,*.html,*.c,*.cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2

" For guake terminal
set guicursor=

" Change leader to SPACE
let mapleader=" "


" [ALE] Settings for python linter
" flake8をLinterとして登録
let g:ale_linters = {
    \ 'python': ['flake8'],
    \ }

" 各ツールをFixerとして登録
let g:ale_fixers = {
    \ 'python': ['autopep8', 'black', 'isort'],
    \ }

" ついでにFixを実行するマッピングしとく
nmap <silent> <Leader>x <Plug>(ale_fix)
" ファイル保存時に自動的にFixするオプションもあるのでお好みで
let g:ale_fix_on_save = 1
