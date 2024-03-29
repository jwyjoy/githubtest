""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"이후 수정 - YuriHan
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 프로그램 기본 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 오리지널 Vi 와의 호환성을 없애고, Vim 만의 기능들을 쓸 수 있게 함.
set nocp

" 모든 옵션을 원래대로 복원
set all&

" 명령어 기록을 남길 갯수 지정
set hi=100

" 백스페이스 사용
set bs=indent,eol,start

" 인코딩 설정
" 문서를 읽을 때 BOM 을 자동으로 제거하려면, fencs 맨 앞에 ucs-bom 를 추가하세요.
"let &tenc=&enc
"set enc=utf-8
set fenc=cp949
set fencs=utf-8,cp949,cp932,euc-jp,shift-jis,big5,ucs-2le,latin1


source $VIMRUNTIME/mswin.vim

" 홈 디렉토리가 존재할 때에만 사용할 수 있는 기능들
if exists("$HOME")

" 홈 디렉토리를 구한다.
" 특정 시스템에서는 홈 디렉토리 경로 끝에 / 또는 \ 문자가
" 붙어 있기 때문에, 그것들을 제거한다.
    let s:home_dir = $HOME
    let s:temp = strpart(s:home_dir,strlen(s:home_dir)-1,1)
    if s:temp == "/" || s:temp == "\\"
        let s:home_dir = strpart(s:home_dir,0,strlen(s:home_dir)-1)
    endif

" 경로 설정
if has("win32")
    let s:dir_tmp = s:home_dir."/_vim/tmp"
    let s:dir_backup = s:home_dir."/_vim/backup"
else
    let s:dir_tmp = s:home_dir."/.vim/tmp"
    let s:dir_backup = s:home_dir."/.vim/backup"
endif


set exrc
" 임시 디렉토리 설정
"    if isdirectory(s:dir_tmp)
"        set swf
"        let &dir = s:dir_tmp
"    else
"        set noswf
"        set dir=.
"    endif

" 백업 디렉토리 설정
"    if isdirectory(s:dir_backup)
"        set bk
"        let &bdir = s:dir_backup
"        set bex=.bak
"    else
"        set nobk
"    endif

endif

" 파일 찾기 경로 설정



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 플러그인 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist 설정
"let Tlist_Ctags_Cmd = 'C:\Progra~1\Vim\Vim71\ctags.exe'
"let Tlist_Auto_Open = 1
"let Tlist_Auto_Update = 1
"let Tlist_WinWidth = 28

" minibufexpl 설정
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
cabbr b Bs


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 편집 기능 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 커서의 위치를 항상 보이게 함.
set ru

" 완성중인 명령을 표시
set sc

" 줄 번호 표시
set nu

" 줄 번호 표시 너비 설정
set nuw=5

" 탭 크기 설정
set ts=4
set sw=4

" 탭 -> 공백 변환 기능 (사용 안함)
set noet
set sts=0

" 자동 줄바꿈 안함
set nowrap

" 마지막 편집 위치 복원 기능
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "norm g`\"" |
\ endif

" gVim 을 사용중일 경우 클립보드를 unnamed 레지스터로 매핑
" xterm_clipboard 기능이 있을 때에도 매핑 가능
if has("gui_running") || has("xterm_clipboard")
    set cb=unnamed
endif

" magic 기능 사용
set magic

" 여러 가지 이동 동작시 줄의 시작으로 자동 이동
set sol

" 비주얼 모드에서의 동작 설정
set sel=exclusive

" SHIFT 키로 선택 영역을 만드는 것을 허용
" 영역 상태에서 Ctrl+F,B 로 이동하면 영역이 해제되어 버려서 해제
set km=startsel,stopsel

" 가운데 마우스 버튼으로 붙여넣기 하는 것을 무효화한다.
map <MiddleMouse> <Nop>
map! <MiddleMouse> <Nop>

" 괄호짝 찾기 기능에 사용자 괄호 종류를 더한다.
set mps+=<:>

" 새로 추가된 괄호의 짝을 보여주는 기능
"set sm

" Insert 키로 paste 상태와 nopaste 상태를 전환한다.
" 함수 방식으로 바꾸었다. 자세한 것은 아래로~
"set pt=<Ins>

" 키 입력 대기시간을 무제한으로, 그러나 key codes 에 대해서는 예외
set noto ttimeout

" 키 입력 대기시간 설정 (milliseconds) (ttm 을 음수로 설정하면 tm 을 따라감)
set tm=3000 ttm=100

" 영역이 지정된 상태에서 Tab 과 Shift-Tab 으로 들여쓰기/내어쓰기를 할 수 있도록 함.
vmap <Tab> >gv
vmap <S-Tab> <gv

" 입력이 중단된 후 얼마 후에 swap 파일을 쓸 것인지와
" CursorHold 이벤트의 대기시간을 설정 (milliseconds)
set ut=5000

" 몇 글자를 입력받으면 swap 파일을 쓸 것인지 설정
set uc=100


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 검색 기능 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 검색어 강조 기능
set hls

" 검색시 파일 끝에서 처음으로 되돌리기 안함
set nows

" 검색시 대소문자를 구별하지 않음
set ic

" 똑똑한 대소문자 구별 기능 사용
set scs


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 모양 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" GUI 이면, 시작시 크기, 위치 설정
"if has("gui_running")
"    set lines=100
"    set co=171
"    winp 4 4
"endif

" 시작시 전체화면으로 설정
" 이제 이것도 귀찮아졌다...!
if has("win32")
    au GUIEnter * simalt ~x
endif

" 추적 수준을 최대로
set report=0

"자동줄바꿈
set wrap

" 항상 status 라인을 표시하도록 함.
set ls=2

" 폰트 설정
"if has("gui_running")
"    if has("win32")
"        set gfn=굴림체:h9:cHANGEUL
"        set gfn=GulimChe:h9:cHANGEUL
"    elseif has("unix")
"        set gfn=monospace\ 9
"    endif
"    set gfn=Jung9\ 9
"    set gfn=Fixedsys:h12:cHANGEUL
"endif

" 줄 간격 설정
set lsp=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype 기능 & Syntax Highlighting 기능
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 파일의 종류를 자동으로 인식
filet plugin indent on

" 몇몇 커스텀 확장자들에게 파일 형식 설정
"au BufRead,BufNewFile *.dic setl ft=php

" 파일 형식에 따른 Syntax Highlighting 기능을 켠다
sy enable


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 자동 들여쓰기 사용 안함
"set noai

" 똑똑한 들여쓰기 사용 안함
"set nosi

" 내장된 indent 파일이 없어서 C indent 를 사용하는 경우
au FileType ,jsp setl cin

" 각 언어의 표준 indent 를 사용하는 경우
" 수동 추가하기가 귀찮아져서 결국 자동 인식으로 바꿨다.
"au FileType c,cpp,html,vim,java,sh,python,xml,perl,xf86conf,conf,apache
"\ if expand("<amatch>") != "" |
"\   if exists("b:did_indent") |
"\        unlet b:did_indent |
"\   endif |
"\ runtime! indent/<amatch>.vim |
"\ endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 컬러 스킴 (:colo inkpot)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim color file
" Dark (grey on black) color scheme based on on a popular torte config.
" Maintainer: Sergei Matusevich <motus@motus.kiev.ua>
" ICQ: 31114346 Yahoo: motus2
" http://motus.kiev.ua/motus2/Files/motus.vim
" Last Change: 3 November 2005
" Orinal torte screme maintainer: Thorsten Maerz <info@netztorte.de>
" Licence: Public Domain

" INSTALLATION: copy this file to ~/.vim/colors/ directory
" and add "colorscheme motus" to your ~/.vimrc file

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "motus"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
highlight Normal     guifg=Grey80    guibg=Black
highlight Search     guifg=Grey guibg=DarkBlue
highlight Visual     guifg=Black guibg=DarkGrey gui=NONE
highlight Search     guifg=White guibg=Red gui=NONE
" highlight Cursor     guifg=Black    guibg=Green    gui=bold
highlight Special    guifg=Orange
highlight Comment    guifg=#00a7a7
highlight Statement  guifg=Yellow            gui=NONE
highlight Type                        gui=NONE
highlight Pmenu        guifg=Black guibg=darkGray    gui=None
highlight PmenuSel        guibg=red guifg=white    gui=None

highlight VertSplit    gui=bold guifg=Grey25    guibg=Black
highlight StatusLine   gui=bold guifg=White     guibg=Grey25
highlight StatusLineNC gui=NONE guifg=LightGrey guibg=Grey25

highlight FoldColumn     gui=bold guifg=White guibg=Black
highlight Folded            guifg=#80a0ff guibg=Black

" Console
highlight Normal     ctermfg=LightGrey    ctermbg=Black
highlight Search     ctermfg=Grey    ctermbg=DarkBlue    cterm=NONE
highlight Visual                    cterm=reverse
" highlight Cursor     ctermfg=Black    ctermbg=Green    cterm=bold
highlight Special    ctermfg=Brown
highlight Comment    ctermfg=Blue
highlight Statement  ctermfg=Yellow        cterm=NONE
highlight Type        cterm=NONE

highlight VertSplit        ctermfg=DarkGrey    ctermbg=Black    cterm=bold
highlight StatusLine    ctermfg=White    ctermbg=Grey    cterm=bold
highlight StatusLineNC    ctermfg=Black    ctermbg=Grey    cterm=NONE

highlight FoldColumn    ctermbg=Black    ctermfg=White    cterm=bold


" only for vim 5
if has("unix")
  if v:version<600
    highlight Normal  ctermfg=Grey    ctermbg=Black    cterm=NONE    guifg=Grey80      guibg=Black    gui=NONE
    highlight Search  ctermfg=Black    ctermbg=Red    cterm=bold    guifg=Black       guibg=Red    gui=bold
    highlight Visual  ctermfg=Black    ctermbg=yellow    cterm=bold    guifg=Grey25            gui=bold
    highlight Special ctermfg=LightBlue            cterm=NONE    guifg=LightBlue            gui=NONE
    highlight Comment ctermfg=Cyan            cterm=NONE    guifg=LightBlue            gui=NONE
  endif
endif


com -nargs=0 Html :so $VIMRUNTIME/syntax/2html.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 단축키 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 상용구 설정
"iab xdate <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
"iab xtime <C-R>=strftime("%H:%M:%S")<CR>
"iab xname 인클루드

" BufExplorer 플러그인 (스크립트 번호: 42)
" :ls 와 :b 에 익숙해져서 이젠 필요없다...
"nnoremap <silent> <F6> :BufExplorer<CR>

" Vim 자체 Explore 기능
" :E 라는 게 있었군...
"nnoremap <silent> <F6> :Explore<CR>

" Vim 정규식이 아닌 진짜 정규식 사용을 의무화(?)
" \v 라는 글자가 항상 표시되니까 햇갈린다... -.-
"map / /\v

" <F2> 새 탭 열고 파일 열기
"map <F2> :tabnew<CR>:

" <F5> 실행 설정
"if has("gui_running")
"    map <F5> :!%<
"elseif has("unix")
"    map <F5> :!./%<
"endif

" <F7> 컴파일 설정
"map <F7> <F8>:!gcc % -o %<<CR>

" <F8> 저장 & taglist update 설정
"map <F8> :w<CR>
if has('vim_starting')
	    set nocompatible               " be iMproved
		    set runtimepath+=~/.vim/bundle/neobundle.vim
		endif

		call neobundle#rc(expand('~/.vim/bundle/'))

		NeoBundle 'Shougo/neobundle.vim'
		NeoBundle 'Shougo/vimproc'
		NeoBundle 'VimClojure'
		NeoBundle 'Shougo/vimshell'
		NeoBundle 'Shougo/unite.vim'
		NeoBundle 'Shougo/neocomplcache'
		NeoBundle 'Shougo/neosnippet'
		NeoBundle 'jpalardy/vim-slime'
		NeoBundle 'scrooloose/syntastic'
		""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

		NeoBundle 'alpaca-tc/alpaca_tags'
		NeoBundle 'AndrewRadev/switch.vim'
		NeoBundle 'bbatsov/rubocop'
		NeoBundle 'tpope/vim-endwise'

		filetype plugin indent on     " required!
"
" <F9> taglist 실행
"map <F9> :TlistToggle<CR>

" <F10> minibufexpl 실행
"map <F10> :TMiniBufExplorer<CR>

" <F11> ShowMarks :: 마크로 이동하기
"map <F11> :ShowMarksPlaceMark<CR>

" <F12> clear mark :: 현재 마크 지우기
"map <F12> :ShowMarksClearMark<CR>
"

nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <silent> <F4> :FuzzyFinderBuffer<CR>
nnoremap <silent> <F5> :Tlist<CR>
nnoremap <silent> <F6> :TlistUpdate<CR>
nnoremap <silent> <F7> :TlistSync<CR>


nnoremap <silent> <C-F9> :copen<CR>
nnoremap <silent> <F9> :w!<cr>:mak<CR>
nnoremap <silent> <F10> :Run<CR>
nnoremap <silent> <C-F10> :!insight %<.exe<CR>
nnoremap <silent> <C-F1> :cs add D:\Utility\MinGW\include\cscope.out<CR>

" nnoremap <silent> <C-SPACE> i<C-p>



au BufRead,BufNewFile *.c,*.cpp
\ if !filereadable("Makefile") |
\ set makeprg=g++\ %\ -g\ -o\ %< |
\ endif |
\ com! -nargs=* -complete=file Run !%< <args>

au BufRead,BufNewFile *.lua
\ if !filereadable("Makefile") |
\ set makeprg=luac\ -o\ %<.lub\ %\ |
\ endif |
\ com! -nargs=* -complete=file Run !lua ./%<.lub



" =============================================================================
" 커서가 위치한 영어단어를 야후사전에서 찾아줌
" stops the console window from flashing up on the screen
" =============================================================================
map <F8> :!start c:\progra~1\intern~1\iexplore.exe http://kr.engdic.yahoo.com/result.html?p=<cword><CR>




" =============================================================================
" 폴더를 사용하는 방법에 대해서 설정한다. marker 는 { {{ 와 같은 표식을
" 사용하여 폴딩 되는 소스의 범위를 설정 해 놓는다. 이는 이 파일을 다시
" 열었을때 기존의 폴더 정보를 그대로 유지 할수 있게 해 준다.
" =============================================================================
set foldmethod=marker

" =============================================================================
" 폴더 설정이 되어 있는 파일을 열었을때 폴더 되어 있는 레벨을 설정한다.
" 기본값 0이고 모두 폴딩된다.
" =============================================================================
set fdl=0

" =============================================================================
" 소스파일이 폴딩 되어 있을때 폴딩범위를 보여주는 컬럼의 수를 설정한다.
" =============================================================================
set fdc=0



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI 간소화
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_running")

" gVim 메뉴를 사용하지 않는다. 대부분의 명령보다 선행되어야 한다.
"    let did_install_default_menus = 1
"    let did_install_syntax_menu = 1
"    let skip_syntax_sel_menu = 1
" 설정 방식이 바뀌었다.
"    set go-=m

" 툴바를 보이지 않게 한다.
"    set go-=T

" 스크롤바를 표시하지 않는다.
"    set go-=l
"    set go-=L
"    set go-=r
"    set go-=R
"    set go-=b

" GUI 여서 마우스가 사용 가능하면...
" 마우스를 사용
    set mouse=a
"    set mouse=

" 마우스 모델을 popup 으로 함.
    set mousem=popup

" '간단한 선택' 다이얼로그가 새 창에서 뜨지 않도록...
"    set go+=c

endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 편리한 기능
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tab 자동 완성시 가능한 목록을 보여줌
set wmnu

" 파일 탐색기 설정
let g:explVertical=1
let g:explSplitRight=1
let g:explStartRight=1
let g:explWinSize=20

" vim -b : xxd 포맷으로 바이너리 파일을 수정합니다! (:help hex-editing)
" ...너무 ㅂㅌ적인 방법인 것 같아서 주석처리;
"augroup Binary
"    au!
"    au BufReadPre  *.bin let &bin=1
"    au BufReadPost *.bin if &bin | %!xxd
"    au BufReadPost *.bin set ft=xxd | endif
"    au BufWritePre *.bin if &bin | %!xxd -r
"    au BufWritePre *.bin endif
"    au BufWritePost *.bin if &bin | %!xxd
"    au BufWritePost *.bin set nomod | endif
"augroup END

" Spell Checking 기능 (영어)
" 기본적으로는 비활성화
set nospell spelllang=en

" 각종 toggle 기능
fu! ToggleNu()
    let &nu = 1 - &nu
endf
fu! ToggleList()
    let &list = 1 - &list
endf
fu! TogglePaste()
    let &paste = 1 - &paste
endf
fu! ToggleSpell()
    let &l:spell = 1 - &l:spell
endf
map \n :call ToggleNu()<CR>
map \l :call ToggleList()<CR>
map \p :call TogglePaste()<CR>
map \s :call ToggleSpell()<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 자주 틀리는 글자 수정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ab fucntion function
ab calss class
ab functio function
ab dunction function
ab functuin function
ab dunction function
ab functuin function
ab functopn function
ab fumction function
ab vlass class
ab xlass class
ab classs class
ab forarch foreach
ab inser insert
ab insertt insert
ab quewrty query
ab ovject object
ab objectr object
ab evho echo
ab printr print_r
ab prit print
ab fales false
ab treu true
ab teur true
ab nulll null
ab nuii null
ab retrun return
ab retunr return
ab htis this
ab erturn return


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 기타 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 매크로 실행중에 화면을 다시 그리지 않음
set lz

" 프로그램 시작시 플러그인 로드
set lpl

"noeol 설정
"au BufNew * set bin | set noeol
"set bin | set noeol

" ㅂㅌ barosl 은 모든 플랫폼에서 unix 줄 변경자를 쓰겠습니다! ..orz
" 경고: 만일 당신의 vim 이 '정상적으로' 동작하길 원하시면,
" 바로 다음줄은 주석처리 하거나 없애세요. -.-;;
" set ff=unix

" unix dos mac 줄 변경자 모두 다 읽을 수 있도록 합니다.
set ffs=unix,dos,mac

set csprg=C:\Progra~1\Vim\Vim72\cscope.exe
"set csto=0
"set cst
"set nocsverb

set tags=./tags,tags
set tags+=D:\Utility\MinGW\include\tags
"cs add D:\Utility\MinGW\include\cscope.out

if filereadable ("./cscope.out")
    cs add cscope.out
endif

set scrolloff=5

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FORTH
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufRead,BufNewFile *.f setl ft=forth
au BufRead,BufNewFile *.frm setl ft=forth


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End of File
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let b:dochelpdelay=100
