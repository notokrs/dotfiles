set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

call plug#begin("~/.vim/plugged")
" Plugin Section
	"if has('nvim')
  	"	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	"else
  	"	Plug 'Shougo/deoplete.nvim'
  	"	Plug 'roxma/nvim-yarp'
  	"	Plug 'roxma/vim-hug-neovim-rpc'
	"endif
	"let g:deoplete#enable_at_startup = 1
	
	Plug 'scrooloose/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'morhetz/gruvbox'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'
	
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
call plug#end()


" Config Section
	syntax enable
	set nu
	set number
	" colorscheme dracula

	let g:NERDTreeShowHidden = 1
	let g:NERDTreeMinimalUI = 1
	let g:NERDTreeIgnore = []
	let g:NERDTreeStatusline = ''
	" Automaticaly close nvim if NERDTree is only thing left open
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	" Toggle
	nnoremap <silent> <C-b> :NERDTreeToggle<CR>

	" open new split panes to right and below
	set splitright
	set splitbelow
	" turn terminal to normal mode with escape
	tnoremap <Esc> <C-\><C-n>
	" start terminal in insert mode
	au BufEnter * if &buftype == 'terminal' | :startinsert | endif
	" open terminal on ctrl+n
	function! OpenTerminal()
	  split term://bash
	  resize 10
	endfunction
	nnoremap <c-n> :call OpenTerminal()<CR>

	" use alt+hjkl to move between split/vsplit panels
	tnoremap <A-h> <C-\><C-n><C-w>h
	tnoremap <A-j> <C-\><C-n><C-w>j
	tnoremap <A-k> <C-\><C-n><C-w>k
	tnoremap <A-l> <C-\><C-n><C-w>l
	nnoremap <A-h> <C-w>h
	nnoremap <A-j> <C-w>j
	nnoremap <A-k> <C-w>k
	nnoremap <A-l> <C-w>l

	nnoremap <C-p> :FZF<CR>
	let g:fzf_action = {
	  \ 'ctrl-t': 'tab split',
	  \ 'ctrl-s': 'split',
	  \ 'ctrl-v': 'vsplit'
	  \}

