Installation:

    git clone git://github.com/juanique/dotfiles.git ~/dotfiles

Create symlinks

    ln -s ~/dotfiles/dotvim ~/.vim
    ln -s ~/dotfiles/vimrc ~/.vimrc
    ln -s ~/dotfiles/gvimrc ~/.gvimrc
    ln -s ~/dotfiles/bashrc ~/.bashrc
    ln -s ~/dotfiles/zshrc ~/.zshrc

If you don't have a bin directory yourself, you should

    ln -s ~/dotfiles/bin ~/bin

Or take whatever you like from `dotfiles/bin` directory

You need to create the vcprompt program to display git information on your shell. If you don't, remove `$(vcprompt)` from `bash/config` and `zsh/config` to avoid errors.

    ~/dotfiles/bin/vcprompt-install

Make sure the generated `vcprompt` its on your system's PATH.

Load submodules

    cd ~/dotfiles
    git submodule init
    git submodule update
