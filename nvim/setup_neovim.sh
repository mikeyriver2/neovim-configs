# Basic script to get basics to work and install

APP_HOME=~/neovim_setup 
BASH_SCRIPT='
nvim() {
    command nvim "$@"
    rc=$?
    cd "$(cat "$HOME/tmp/vim/cwd")" && rm "$HOME/tmp/vim/cwd"
    return $rc
}
'

sudo apt-get update
sudo apt-get install -y curl unzip python3 python3-pip
npm i -g eslint

# Download Fonts and Setup Jetbrain Nerd Font
curl -o jb.zip -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip \
  && unzip jb.zip -d ./fonts \
  && mkdir -p ~/.local/shares/fonts \
  && mv ./fonts/* ~/.local/shares/fonts
  # User then has to set font manually of their terminal

# Download neovim and set it in the path
curl -o nvim.tar.gz -L https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.tar.gz \
 && tar -xvf nvim.tar.gz \
 && mkdir -p ~/.local/bin/neovim \
 && mv nvim-linux-x86_64/* ~/.local/bin/neovim \
 && ln -s ~/.local/bin/neovim/bin/nvim ~/.local/bin/nvim

# Append script to .bashrc
echo "$BASH_SCRIPT" | tee -a ~/.bashrc

# Install PlugInstall before
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

source ~/.bashrc

~/.local/bin/nvim --headless +"PlugInstall" +qall

