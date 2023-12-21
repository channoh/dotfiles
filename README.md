# Personal Configuration
default configs for Ubuntu

## SSH directory permission
```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*
```

## Installation

```
git clone https://github.com/channoh/.dotfiles.git
cd .dotfiles
./install.sh
```

### Dependencies

#### Vim 8.1

1. Download and compile
    ```
    wget http://ftp.vim.org/pub/vim/unix/vim-8.1.tar.bz2
    tar -jxvf vim-8.1.tar.bz2
    cd vim81
    ./configure --with-features=huge \
                --enable-multibyte \
                --enable-rubyinterp \
                --enable-pythoninterp \
                --enable-luainterp \
                --enable-gui= gtk2 \
                --enable-cscope \
                --with-python-config-dir=/usr/lib/python2.7/config \
                --with-x \
                --prefix=$HOME/.local
    make VIMRUNTIMEDIR=$HOME/.local/share/vim/vim81
    make install
    ```

2. Set vim as default editor
    ```
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
    sudo update-alternatives --set editor /usr/bin/vim
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
    sudo update-alternatives --set vi /usr/bin/vim
    ```

##### vim plugins

 1. VundleVim/Vundle.vim            - vundle manager
 1. ekalinin/dockerfile.vim         - syntax and indentation for Dockerfile
 1. jiangmiao/auto-pairs            - insert or delete brackets, parens, quotes in pair
 1. Yggdroot/indentLine             - display thin vertical lines at each indentation level
 1. scrooloose/nerdtree             - file system explorer
 1. ryanoasis/vim-devicons
 1. tiagofumo/vim-nerdtree-syntax-highlight
 1. majutsushi/tagbar               - browse the tags of the current file
 1. triglav/vim-visual-increment    - increase and decrease number or letters sequence via visual mode
 1. will133/vim-dirdiff             - show difference between two directories using vimdiff
 1. bling/vim-airline               - status line
 1. vim-airline/vim-airline-themes
 1. godlygeek/tabular               - easily align text
 1. plasticboy/vim-markdown         - for markdown
 1. scrooloose/nerdcommenter        - Comment functions
 1. haya14busa/incsearch.vim        - incrementally highlights ALL pattern matches
 1. mhinz/vim-startify              - Fency start screen
 1. vim-scripts/SyntaxRange         - Syntax range (for Gem5)
 1. octol/vim-cpp-enhanced-highlight


#### Tmux 2.9a
```bash
wget https://github.com/tmux/tmux/releases/download/2.9a/tmux-2.9a.tar.gz
tar xzf tmux-2.9a.tar.gz
cd tmux-2.9a
CFLAGS="-I$HOME/.local/include" LDFLAGS="-L$HOME/.local/lib" ./configure --prefix=$HOME/.local
make -j && make install && cd .. && rm -rf tmux-2.9a*
```


#### Ncurses 5.9
```bash
wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz
tar -zxvf ncurses-5.9.tar.gz
cd ncurses-5.9/
./configure --prefix=$HOME/.local --with-shared --enable-pc-files --enable-overwrite
make -j && make install && cd .. & rm -rf ncurses*
```


#### libevent 2.1.12
```bash
wget https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz
tar xzf libevent-2.1.12-stable.tar.gz
cd libevent-2.1.12-stable/
./configure --prefix=$HOME/.local && make -j && make install && cd .. && rm -rf libevent-2.1.12-stable*
```

#### readline 6.3
```bash
wget https://ftp.gnu.org/gnu/readline/readline-6.3.tar.gz
tar xzf readline-6.3.tar.gz
cd readline-6.3
./configure --prefix=$HOME/.local && make -j && make install && cd .. && rm -rf readline-6.3*
```

#### texinfo 6.8
```bash
wget https://ftp.gnu.org/gnu/texinfo/texinfo-6.8.tar.xz
tar xzf texinfo-6.8.tar.xz
cd texinfo-6.8
./configure --prefix=$HOME/.local && make -j && make install && cd .. && rm -rf texinfo-6.8*
```

#### cgdb 0.7.0
```bash
wget https://cgdb.me/files/cgdb-0.7.0.tar.gz
tar xzf cgdb-0.7.0.tar.gz
cd cgdb-0.7.0
CFLAGS="-I$HOME/.local/include" LDFLAGS="-L$HOME/.local/lib" ./configure --prefix=$HOME/.local
CFLAGS="-I$HOME/.local/include" INCLUDES="-I$HOME/.local/include" LDFLAGS="-L$HOME/.local/lib" make -j
make install && cd .. && rm -rf cgdb-0.7.0*
```


## Font
Download [Source Code Pro with Nerd Font](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf?raw=true) from [github.com/ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts).


## Useful packages
 1. cgdb-0.7.0 (https://cgdb.me/files/cgdb-0.7.0.tar.gz)
 2. parallel-20190322
 4. tree-1.8.0 (http://mama.indstate.edu/users/ice/tree/src/tree-1.8.0.tgz)
