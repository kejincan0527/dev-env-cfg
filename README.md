#Ubuntu development environment config
##Getting Start
1. Install git, zsh, tmux
    * `apt-get install git zsh tmux`
2. Configure zsh
    * `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
    * `cp .zshrc ~`
    * `chsh -s /bin/zsh`
3. Configure tmux
    * `cp .tmux.conf ~`
4. Install python-dev
    * `apt-get install python*.*-dev` (replace * with your python version)
5. Install ruby
    * `gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3`
    * `\curl -sSL https://get.rvm.io | bash -s stable`
    * `rvm istall *.*.*` (replace * with any ruby version you like)
6. Install vim
    * `git clone https://github.com/vim/vim.git`
    * `cd vim`
    * `./configure --enable-rubyinterp=yes --enable-pythoninterp=yes`
    * `apt-get install ncurses-dev` if no terminal library found
    * `make`
    * `make install`
    * `rm /usr/bin/vi` && `ln -s /usr/local/bin/vim /usr/bin/vi` if necessary
    * `ln -s ~/.rvm/rubies/ruby-*.*.*/lib/libruby.so.*.* /usr/lib` (replace * with ruby version you install)
7. Configure vim
    * `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
    * `cp .vimrc ~`
    * `:BundleInstall` in vim mode
    * `apt-get install python-pip`
    * `pip install requests`
    * `git clone https://github.com/Kitware/CMake.git`
    * `./bootstrap && make -j4 && make install`
    * `cd ~/.vim/bundle/YouCompleteMe`
    * `./install.py --clang-completer`

##Some useful tools
1. Mosh
    * Ssh with UDP
    * `apt-get install mosh`
2. Ccache
    * C language cache
    * `apt-get install ccache`
    * Add `export PATH="/usr/lib/ccache:$PATH"` to your shell config file
3. Ctags
    * Quickly and easily located index generator
    * `apt-get install ctags`
    * Create index by `ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --if0=yes <dir>`
    * Shortcuts
        - Ctrl+] - go to definition
        - Ctrl+T - Jump back from the definition.
        - Ctrl+W Ctrl+] - Open the definition in a horizontal split
4. Cpplint
    * C language syntax check
    * `pip install cpplint`
5. ShadowSocks
    * Socks5 proxy
    * `pip install shadowsocks`
    * `cp shadowsocks /etc/init.d`
    * `service shadowsocks start`
