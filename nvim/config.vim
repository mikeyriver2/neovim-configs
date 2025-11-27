set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set noautochdir
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2          " see multiple spaces as tabstops so <BS> does the right thing
set nowrap!
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set relativenumber                 " add line numbers
set number
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard+=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download
" language package)
set noswapfile            " disable creating swap file
set backupdir=~/.cache/vim " Directory to store backup files.

call plug#begin()

" Plugin Section

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
" Plug 'yuezk/vim-js'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim', {'tag': 'v2.20.8'} 
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'maxmellon/vim-jsx-pretty'
Plug 'nvim-lualine/lualine.nvim'
"Plug 'vimpostor/vim-tpipeline'
Plug 'neovim/nvim-lspconfig'
Plug 'dracula/vim'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'williamboman/mason.nvim', {'tag': 'v1.11.0'}
Plug 'williamboman/mason-lspconfig.nvim', {'tag': 'v1.30.0'}
Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'airblade/vim-rooter'
Plug 'prisma/vim-prisma'
Plug 'pantharshit00/coc-prisma'
Plug 'danymat/neogen'

Plug 'folke/trouble.nvim'
"Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvimtools/none-ls.nvim'
Plug 'nvimtools/none-ls-extras.nvim'

Plug 'ahmedkhalf/project.nvim'
Plug 'dstein64/vim-startuptime'

Plug 'tpope/vim-surround'
Plug 'akinsho/git-conflict.nvim', { 'tag': '*' }

"Plug 'nvim-java/lua-async-await'
"Plug 'nvim-java/nvim-java-refactor'
"Plug 'nvim-java/nvim-java-core'
"Plug 'nvim-java/nvim-java-test'
"Plug 'nvim-java/nvim-java-dap'
"Plug 'nvim-java/nvim-java' 
"Plug 'JavaHello/spring-boot.nvim'

Plug 'mfussenegger/nvim-dap'
Plug 'neovim/nvim-lspconfig'
Plug 'MunifTanjim/nui.nvim'
Plug 'kdheepak/lazygit.nvim'

" Deps
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'

" Optional deps
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-tree/nvim-web-devicons' "or Plug 'echasnovski/mini.icons'
Plug 'HakonHarnes/img-clip.nvim'
Plug 'zbirenbaum/copilot.lua'
Plug 'stevearc/dressing.nvim' " for enhanced input UI
Plug 'folke/snacks.nvim' " for modern input UI

" Yay, pass source=true if you want to build from source
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }

Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} " Replace <CurrentMajor> by the latest released major (first number of latest release)
Plug 'mlaursen/vim-react-snippets'

"Plug 'rmagatti/auto-session'

call plug#end()

let uname = substitute(system('uname'),'\n','','')
if uname == 'Linux'
    let lines = readfile("/proc/version")
    if lines[0] =~ "Microsoft"
      let g:clipboard = {
        \   'name': 'win32yank-wsl',
        \   'copy': {
        \      '+': 'win32yank.exe -i --crlf',
        \      '*': 'win32yank.exe -i --crlf',
        \    },
        \   'paste': {
        \      '+': 'win32yank.exe -o --lf',
        \      '*': 'win32yank.exe -o --lf',
        \   },
        \   'cache_enabled': 0,
        \ }
    else
      let g:clipboard = {
        \   'name': 'xclip-xfce4-clipman',
        \   'copy': {
        \      '+': 'xclip -selection clipboard',
        \      '*': 'xclip -selection clipboard',
        \    },
        \   'paste': {
        \      '+': 'xclip -selection clipboard -o',
        \      '*': 'xclip -selection clipboard -o',
        \   },
        \   'cache_enabled': 1,
        \ }
    endif
endif

" Save last position in file
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   execute "normal! g`\"" |
	\ endif

map <F6> :NERDTreeToggle<CR>
nnoremap <C-a> ggVG
map <leader>r :NERDTreeFind<cr>
map <leader>p :Telescope projects<cr>
map <C-h> b
map <C-l> e
noremap <Del> "_d
xnoremap p "_dP
" Prevent Ctrl-V from overwriting clipboard when pasting in visual mode
xnoremap <C-v> "_dP

let NERDTreeShowHidden=1

call mkdir(expand('~/tmp/vim'), 'p') " create a directory $HOME/tmp/vim
autocmd VimLeave * call writefile([getcwd()], expand('~/tmp/vim/cwd')) " on exit write the CWD to the file
