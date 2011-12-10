call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" ~/.vimrc (configuration file for vim only)
" skeletons
function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	if $USER != ''
	    let login = $USER
	elseif $LOGNAME != ''
	    let login = $LOGNAME
	else
	    let login = 'unknown'
	endif
	let newline = stridx(login, "\n")
	if newline != -1
	    let login = strpart(login, 0, newline)
	endif
	if $HOSTNAME != ''
	    let hostname = $HOSTNAME
	else
	    let hostname = system('hostname -f')
	    if v:shell_error
		let hostname = 'localhost'
	    endif
	endif
	let newline = stridx(hostname, "\n")
	if newline != -1
	    let hostname = strpart(hostname, 0, newline)
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
	setf spec
endfunction
autocmd BufNewFile	*.spec	call SKEL_spec()
" filetypes
filetype plugin on
filetype indent on

" use ghc functionality for haskell files
au Bufenter *.hs compiler ghc

" switch on syntax highlighting
syntax on

let g:haddock_browser = "/usr/lib/chromium/chrome-wrapper"

set nowrap
set foldenable
set foldmethod=marker
set foldnestmax=10
set number
set hidden
set backspace=2

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map 6 <C-w>>
map 7 <C-w>-
map 8 <C-w>+
map 9 <C-w><

map <z-l> zl

nmap <leader>l :set list!<CR>
nmap <leader>t :set ts=4 sts=4 sw=4<CR>
nmap <leader>T :set ts=8 sts=8 sw=8<CR>
nmap <leader>e :set expandtab<CR>
nmap <leader>E :set noexpandtab<CR>

" ~/.vimrc ends here
