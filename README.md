##Get the code

    git clone git://github.com/juanique/dotfiles.git ~/dotfiles

##Quickstart

The quickstart command executes all the commands detailed on the Manual Installation section below. Read it to be sure that is what you want.

    ~/dotfiles/quickstart

##Manual installation:

Remove previous config files

    rm -f ~/.vim
    rm -f ~/.vimrc
    rm -f ~/.gvimrc
    rm -f ~/.bashrc
    rm -f ~/.zshrc

Create symlinks

    ln -s ~/dotfiles/dotvim ~/.vim
    ln -s ~/dotfiles/vimrc ~/.vimrc
    ln -s ~/dotfiles/gvimrc ~/.gvimrc
    ln -s ~/dotfiles/bashrc ~/.bashrc
    ln -s ~/dotfiles/zshrc ~/.zshrc

If you don't have a bin directory yourself, you should

    ln -s ~/dotfiles/bin ~/bin

Or symlink whatever you want from `dotfiles/bin` directory

You need to create the vcprompt program to display git information on your shell. If you don't, remove `$(vcprompt)` from `bash/config` and `zsh/config` to avoid errors.

    ~/dotfiles/bin/vcprompt-install

Make sure the generated `vcprompt` is on your system's PATH.

Load submodules

    cd ~/dotfiles
    git submodule init
    git submodule update

###Temporary files

Vim saves swap and backup files for every file you open. Using this config these are saved by default under `~/tmp/vim_bak`, we need to make sure this directory exists.

    mkdir -p ~/tmp/vim_bak

###Python

The PEP8 plugin (checks code conventions) requires you to have installed the python PEP8 library, and the syntastic plugin (checks for syntax errors) requires `pyflakes` you can install both using `pip`. I would also recommend you install `pylint` if you care about code quality.

If using Ubuntu you may install pip with `apt-get`

    sudo apt-get install python-pip

Then

    sudo pip install pep8 pylint pyflakes


###Command-T

The Command-T plugin allows to quickly open files within your working directory, it requires you to have a ruby enabled VIM version such as vim-nox on ubuntu, if you have the default vim package installed you'll need to delete it.

    sudo apt-get purge vim
    sudo apt-get install vim-nox ruby rake rubygems ruby-dev

Then you can build the plugin.

    cd ~/dotfiles/dotvim/bundle/CommandT/
    rake make
