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

Make sure the generated `vcprompt` its on your system's PATH.

Load submodules

    cd ~/dotfiles
    git submodule init
    git submodule update

The PEP8 plugin requires you to have installed the pytho PEP8 library you can install it using `pip`. I would also recomment you install `pylint` if you care about your code quality.

If using Ubuntu you may install pip with `apt-get`

    sudo apt-get install python-pip

Then

    sudo pip install pep8 pylint
