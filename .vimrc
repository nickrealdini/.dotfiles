" .vimrc
" k.flood.fr

" Set vim behaviour, not vi.
set nocompatible
" Case insensitive search
set ignorecase
" :tn for tabnew
ca tn tabnew
" Enable mouse
set mouse=a
" utf8 ftw
set encoding=utf-8
" tab navigation Ctrl-n for next, Ctrl-p for previous
nmap <silent> <C-n> :tabnext<CR>
nmap <silent> <C-p> :tabprev<CR>
imap <silent> <C-n> <esc><C-n>
imap <silent> <C-p> <esc><C-p>

" Create html tags when typing ,tag
map! ,h1 <h1></h1><esc>2ba
map! ,h2 <h2></h2><esc>2ba
map! ,h3 <h3></h3><esc>2ba
map! ,h4 <h4></h4><esc>2ba
map! ,div <div></div><esc>2ba
map! ,span <span></span><esc>2ba
map! ,p <p></p><esc>2ba
map! ,a <a href=''></a><esc>2bra

" for emails
map! ,c Cordialement,<Enter>~Nicolas CARPi<Enter><esc>
map! ,r Regards,<Enter>~Nicolas CARPi<Enter><esc>

" Create backup files
set backupdir=/Users/ktr/.vim/backup,/tmp
" fix the backspace problem
set backspace=indent,eol,start
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
"set number    "enable line numbering

" Templates
au bufNewFile *.sh 0r ~/.vim/templates/bash.sh

" For crontab bug in Mac OS X (crontab temp file must be edited in place)
au FileType crontab set nobackup nowritebackup

" Syntax highlighting
filetype plugin indent on
syntax on
"colorscheme desert
colorscheme dante

" FOLDS
" save/restore foldings
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" get space to show/hide folds
nnoremap <Space> za

" pathogen is the plugin manager
execute pathogen#infect()

" Ctrl-t to close HTML tags
au FileType html,xml,xsl,php source ~/.vim/bundle/closetag.vim

" search is case sensitive only if you put a CAPITAL
set smartcase

" STATUS LINE
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%-40f\                    " path
set statusline+=%=%1*%y%*%*\              " file type
set statusline+=%10((%l,%c)%)\            " line and column
set statusline+=%P                        " percentage of file

" PYTHON
" #####################
set tabstop=4
set shiftwidth=4
set expandtab
"set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
"set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\
"\ [%l/%L\ (%p%%)
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly

" BEPO
" #####################
" {W} -> [É]
" ——————————
" On remappe W sur É :
"noremap é w
"noremap É W
" Corollaire, pour effacer/remplacer un mot quand on n’est pas au début (daé / laé).
" (attention, cela diminue la réactivité du {A}…)
"noremap aé aw
"noremap aÉ aW
" Pour faciliter les manipulations de fenêtres, on utilise {W} comme un Ctrl+W :
"noremap w <C-w>
"noremap W <C-w><C-w>
 
" [HJKL] -> {CTSR}
" ————————————————
" {cr} = « gauche / droite »
noremap c h
noremap r l
" {ts} = « haut / bas »
noremap t j
noremap s k
" {CR} = « haut / bas de l'écran »
noremap C H
noremap R L
" {TS} = « joindre / aide »
noremap T J
noremap S K
" Corollaire : repli suivant / précédent
noremap zs zj
noremap zt zk
 
" {HJKL} <- [CTSR]
" ————————————————
" {J} = « Jusqu'à »            (j = suivant, J = précédant)
noremap j t
noremap J T
" {L} = « Change »             (h = bloc, H = jusqu'à la fin de ligne)
noremap l c
noremap L C
" {H} = « Remplace »           (l = caractère, L = texte)
noremap h r
noremap H R
" {K} = « Substitue »          (k = caractère, K = ligne)
noremap k s
noremap K S
" Corollaire : correction orthographique
noremap ]k ]s
noremap [k [s
 
" Désambiguation de {g}
" —————————————————————
" ligne écran précédente / suivante (à l'intérieur d'une phrase)
noremap gs gk
noremap gt gj
" onglet précédant / suivant
noremap gb gT
noremap gé gt
" optionnel : {gB} / {gÉ} pour aller au premier / dernier onglet
noremap gB :exe "silent! tabfirst"<CR>
noremap gÉ :exe "silent! tablast"<CR>
" optionnel : {g"} pour aller au début de la ligne écran
noremap g" g0
 
" <> en direct
" ————————————
"noremap " 1
"noremap 1 "
"noremap « 2
"noremap 2 <
"noremap » 3
"noremap 3 >
"noremap ( 4
"noremap 4 (
"noremap ) 5
"noremap 5 )
"noremap @ 6
"noremap 6 @
"noremap + 7
"noremap 7 +
"noremap - 8
"noremap 8 -
"noremap / 9
"noremap 9 /
"noremap * 0
"noremap 0 *
"
" tab fait esc, maj+tab fait tab
inoremap <Tab> <Esc>
inoremap &lt;S-Tab> <Tab>
vnoremap <Tab> <Esc>
vnoremap &lt;S-Tab> <Tab>
" tab navigation like firefox
nmap <C-S-tab> :tabprevious<CR>
nmap <C-tab> :tabnext<CR>
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
imap <C-S-tab> <Esc>:tabprevious<CR>i
imap <C-tab> <Esc>:tabnext<CR>i
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>
map <S-h> gT
map <S-l> gt

