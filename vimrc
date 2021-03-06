"Unix 或 Linux 及MacOS透過curl安裝vim-plug外掛
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
set fileencodings=utf-8,gb2312,big5
hi clear

if exists("syntax_on")
    syntax reset
    syntax on
endif
filetype indent plugin on
lang message zh_TW.utf-8
set nocompatible
set nrformats=
set showcmd
set number
set nopaste
set ai
"分割視窗的邊框字型，預設是|
"set fillchars+=vert:█
hi VertSplit guifg=red guibg=bg
set foldmethod=manual
set splitbelow
set splitright

" Add argument (can be negative, default 1) to global variable i.
" Return value of i before the change.
"function Inc(...)
"  let result = g:i
"  let g:i += a:0 > 0 ? a:1 : 1
"  return result
"endfunction

"Make Vim completion popup menu work just like in an IDE
set completeopt=longest,menuone
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
            \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
            \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

set t_Co=256
set tabpagemax=200
set ignorecase "搜尋不分大小寫
set incsearch "增量搜尋
set clipboard=unnamed
set gfn=Monaco:h16
set guioptions-=T "移除上方工具列
set guioptions-=r "移除右邊捲軸
set go-=L "移除左手邊捲軸
set mouse=r "在vim裡面用滑鼠
"set ttymouse=xterm2
set foldcolumn=0
set ts=8 "tabstop
set expandtab
set softtabstop=4
set shiftwidth=4 "shiftwidth number of spaces to use for autoindenting
set bs=2
set scrolljump=5
set hlsearch  "保留搜尋的高亮

"hi Normal ctermfg=grey ctermbg=black
hi Normal ctermfg=grey 
hi LineNr ctermfg=222 ctermbg=black
hi Search ctermfg=222 ctermbg=Yellow cterm=bold,underline
hi ErrorMsg guibg=White guifg=Red


"單行的上下行
nnoremap j gj
nnoremap k gk

let mapleader=","
"====LEADER Key的設定
"檢易開檔，例如: include("config.php");
nnoremap <Leader>o ^/['"]<CR>l<C-w>gf
"Ctags + Ctrlp
"let you search through your tags file and jump to where tags are defined.
nmap <leader>. :CtrlPTag<cr>


"syntatstic 語法確認的外掛。
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php','phpcs']
let g:syntastic_shell_checkers = ['bash', 'sh']
let g:syntastic_quiet_messages = { "type": "style" }

"保留搜尋結果
nnoremap <F12> :set hlsearch!<CR>
"用, h清除搜尋的高亮
nnoremap <leader>h :let @/ = ""<CR>
"Tagbar熱鍵
nnoremap <silent><Leader>b :TagbarToggle<CR>

"Showmarks，用, c清除所有的Mark
nnoremap <silent><Leader>c :ShowMarksClearAll<CR>

"yank current file's name
nnoremap <leader>e :let @*=expand('%:t')

"移除搜尋結果
command! H let @/=""


"vim-gitgutter
let g:gitgutter_sign_column_always = 1
let g:gitgutter_override_sign_column_highlight = 0
"預設停用gitgutter
let g:gitgutter_signs = 1




let g:cssColorVimDoNotMessMyUpdatetime = 1

"自動縮看
augroup vimrc
    au BufReadPre * setlocal foldmethod=indent
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END


"返回normal model
imap jj <esc>

"到目前目錄
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>


silent! call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'deviny/matchit'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/neocomplcache.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'spf13/vim-colors'
Plug 'moll/vim-node'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'skammer/vim-css-color'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'Raimondi/delimitMate' "自動的quote
Plug 'tpope/vim-surround'
Plug 'vim-scripts/SearchComplete'
Plug 'vim-scripts/ShowMarks'
Plug 'posva/vim-vue'
Plug 'ervandew/supertab'
Plug 'szw/vim-tags'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'tkhren/vim-fake' "假資料
" 使用這個功能, cd ~/.vim/plugged/vimproc;make
Plug 'Shougo/vimproc', {'do': 'make'} "Powerful shell implemented by vim
Plug 'Shougo/vimshell' "Powerful shell implemented by vim, :vimshell
"Plug 'msanders/snipmate.vim' "snipMate.vim aims to be a concise vim script that implements some of TextMate's snippets features in Vim.
Plug 'DataWraith/auto_mkdir' " Vim plugin that allows you to save files into directories that do not exist yet.
Plug 'jwalton512/vim-blade' "Vim syntax highlighting for Blade templates.
Plug 'tobyS/vmustache'      
Plug 'tobyS/pdv'            "pdv需有上方的vmustache"
Plug 'SirVer/ultisnips'
Plug 'stephpy/vim-php-cs-fixer'  "需安裝php-cs-fixer，可用composer裝，composer global require fabpot/php-cs-fixer
Plug 'maksimr/vim-jsbeautify' "先用選取後，壓Ctrl+f, autocmd FileType php要補，這樣php檔才有作用
Plug 'tpope/vim-ragtag' "Tag功能, span| press CTRL+x再壓space，就會變<span></span>
"Plug 'alvan/vim-closetag' "自動close tag. <span|, 然後輸入>，就會變<span></span>(好像沒有很好用，進行註解)
call plug#end()

"closetag
let g:closetag_filenames = "*.html,*.php"

"ragtag
 let g:ragtag_global_maps = 1


"CtrlP
"let g:ctrlp_custom_ignore = 'node_modules\|git'
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules)$'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,bower_components,node_modules,*/cache/*.php,*.pdf,*.doc,*.jpg,*.png
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_user_command = 'find %s -type f ! -path "*bower_components/*" ! -path "*node_modules/*" ! -path "*vendor/*" ! -path "*.git/*"'        " MacOSX/Linux

"vim-php-cs-fixer
let g:php_cs_fixer_level = "psr2"              " which level ?
let g:php_cs_fixer_path = "php-cs-fixer"
"let g:php_cs_fixer_config_file = '.php_cs'       " configuration file
let g:php_cs_fixer_php_path = "php"
map <leader>pf :call PhpCsFixerFixFile()<CR>

"fake
"" Choose a random element from a list
call fake#define('sex', 'fake#choice(["male", "female"])')

"" Get a name of male or female
"" fake#int(1) returns 0 or 1
call fake#define('name', 'fake#int(1) ? fake#gen("male_name")'
                                  \ . ' : fake#gen("female_name")')

"" Get a full name
call fake#define('fullname', 'fake#gen("name") . " " . fake#gen("surname")')

"" Get a nonsense text like Lorem ipsum
call fake#define('sentense', 'fake#capitalize('
                        \ . 'join(map(range(fake#int(3,15)),"fake#gen(\"nonsense\")"))'
                        \ . ' . fake#chars(1,"..............!?"))')

call fake#define('paragraph', 'join(map(range(fake#int(3,10)),"fake#gen(\"sentense\")"))')

"" Alias
call fake#define('lipsum', 'fake#gen("paragraph")')


"Commands                        Mode
"--------                        ----
"nmap, nnoremap, nunmap          Normal mode
"imap, inoremap, iunmap          Insert and Replace mode
"vmap, vnoremap, vunmap          Visual and Select mode
"xmap, xnoremap, xunmap          Visual mode
"smap, snoremap, sunmap          Select mode
"cmap, cnoremap, cunmap          Command-line mode
"omap, onoremap, ounmap          Operator pending mode


"emmet-vim
"html:5_ (Ctrl+y an,)
"vim-tags
let g:vim_tags_auto_generate = 1
let g:vim_tags_directories = [".git", ".hg", ".svn", ".bzr", "_darcs", "CVS"]

"pdv
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

"UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>""


"用F2進入張貼模式
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>


"把ctags建立的檔案存到./vim/tags中，防止被外面的人存取
"ctags --tag-relative=yes -R -f ~/.vim/tags .
"set tags+=~/.vim/tags

"用F3 rebuild ctags
"map <F3> :! ctags --exclude=.git --php-kinds=+cdfi --languages=-javascript,sql --recurse --tag-relative=yes -R -f ~/.vim/tags .<CR>
map <F3> :TagsGenerate!


"用空白重覆執行巨集
nnoremap <Space> @q

":resize +5 (可垂直加五行或減五行)
"nmap <C-A-v> :vertical resize +5 <cr>
map <Up> :res +5<CR> "調整分割視視窗上下
map <Down> :res -5<CR> "調整分割視窗大小
map <C-j> <C-w>5>
map <C-k> <C-w>5<



"用Ctrl+l及Ctrl+h在不同的標標移動
map  <C-l> :tabn<CR><C-w>l
map  <C-h> :tabp<CR><C-w>h

"Shift的hjkl移動normal mode視窗移動
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l
"大寫的H跟Vim的熱鍵有衝突，改用leader h
"nmap <S-h> <C-w>h
"nmap <S-j> <C-w>j
"nmap <S-k> <C-w>k
"nmap <S-l> <C-w>l

"matchit 用%在tag間移動
let loaded_matchit = 1
let b:match_words = '<:>,<div>:</div>'

"NERDTree熱鍵
nmap <silent> <C-N> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeHijackNetrw = 0
let NERDTreeShowLineNumbers= 1 "NERDTree顯示行號"


"重載~/.vimrc設定
nnoremap <F5> :source ~/.vimrc<CR>

"自動縮排
map <F7> mzgg=G`z

nmap <F8> :ShowMarksToggle<CR>
let g:showmarks_include="abcdef"
"用leader kye，我的設定是,來開關，用:h Showmarks看說明
",mt : Toggles ShowMarks on and off.
",mh : Hides an individual mark.
",ma : Hides all marks in the current buffer.
",mm : Places the next available mark.



"===控制滑鼠的模式
function! ToggleMouse(...)
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunc
"滑鼠模式。
map <silent><Leader>m :call ToggleMouse()<CR>


"=====F9標記高亮所有搜尋結果=====
let g:toggleHighlight = 1
function! ToggleHighlight(...)
    if a:0 == 1 "toggle behaviour
        let g:toggleHighlight = 1 - g:toggleHighlight
    endif
    if g:toggleHighlight == 0 "normal action, do the hi
        silent! exe printf('match IncSearch /\V\<%s\>/', escape(expand("<cword>"), "/\'"))
    else
        call  clearmatches()
    endif
endfunction

"高亮最後搜尋的文字
map <f9> :call ToggleHighlight(1)<CR>


"遊標F10自動高亮
let g:toggleCursorMoved = 1
function! ToggleCursorMoved(...)
    if a:0 == 1 "toggle behaviour
        let g:toggleCursorMoved = 1 - g:toggleCursorMoved
        au! CursorMoved
    endif
    if g:toggleCursorMoved == 0 "normal action, do the hi
        autocmd CursorMoved * silent! exe printf('match Search /\<%s\>/', expand('<cword>'))
    else
        call  clearmatches()
    endif
endfunction

"nmap <f10> :autocmd CursorMoved * silent! exe printf('match Search /\<%s\>/', expand('<cword>'))<cr>
map ,/ :call ToggleCursorMoved(1)<CR>
"自動檢測
autocmd! BufWritePost .vimrc source %
".vimrc
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType php vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr

"autocmd CursorMoved * call ToggleCursorMoved()

"vim-airline
let g:airline_theme='papercolor'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
set laststatus=2
let g:airline_powerline_fonts = 1
" old vim-powerline symbols
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'


set background=dark
let g:solarized_termcolors=256
colorscheme molokai

"設定Macvim GUI的字型
set guifont=Source\ Code\ Pro\ for\ Powerline:h16
"MacVim的行高設定
set linespace=3
