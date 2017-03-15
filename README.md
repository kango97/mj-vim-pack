# mjVimPack

This is the Vim Plugin Package for the starter of vim especially for students of Hanyang University.

### Vim color Setting

Put below codes into your terminal.
Ubuntu 16.04

<pre><code>git clone https://github.com/hrzon/mjVimPack.git ~/.config/nvim  
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
sudo apt-get install software-properties-common
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
pip install --upgrade pip
pip2 install --user neovim
pip3 install --user neovim
sudo apt-get install neovim
sudo apt-get install clang
nvim
dconf load /org/gnome/terminal/legacy/profiles:/ < ~/.config/nvim/termSetting/16.04_color.dconf</pre></code>

in the Neovim
<pre><code>:PluginInstall
:UpdateRemotePlugins</code></pre>

(below is for Ubuntu 14.04)

<pre><code>git clone https://github.com/hrzon/mjVimPack.git ~/.config/nvim  
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
sudo apt-get install software-properties-common
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
pip install --upgrade pip
pip2 install --user neovim
pip3 install --user neovim
sudo apt-get install neovim
sudo apt-get install clang
sudo add-apt-repository ppa:gnome3-team/gnome3-staging
sudo apt-get update
sudo apt-get install gnome-terminal
sudo add-apt-repository -r ppa:gnome3-team/gnome3-staging
dconf load /org/gnome/terminal/legacy/profiles:/ < ~/.config/nvim/termSetting/14.04_color.dconf
nvim</pre></code>

in the Neovim
<pre><code>:PluginInstall
:UpdateRemotePlugins</code></pre>

### .bashrc setting
<pre><code>rm ~/.bashrc
ln ~/.config/nvim/termSetting/.bashrc ~/.bashrc</pre></code>

After restarting terminal, you can run the neovim through 'v' instead of 'nvim'
<pre><code>v</code></pre>
