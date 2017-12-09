# DOTFILES FTW :1st_place_medal: 

Atualmente com:
- i3wm
- termite 
- zsh & oh-my-zsh
- vim

# Copy / Paste

```
cd ~
git clone https://github.com/renatoagomes/dotfiles.git
cd dotfiles
git submodule update --recursive --init --remote
```

# zsh && [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

Depende do `curl`

```
cd ~
ln -s ~/dotfiles/zshrc .zshrc
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

# VIM

```
cd ~
ln -s ~/dotfiles/vim .vim
ln -s ~/dotfiles/vim/vimrc .vimrc
```

# Termite

- [termite-install](https://github.com/Corwind/termite-install)


# i3
```
cd ~
ln -s ~/dotfiles/i3 .config/i3
sudo apt-get install i3
```

# @TODO:
- Melhorar readme
- i3
    - Acertar submodulos
    - i3gaps
    - compton
    - bumblebee-status
        - dependencias?


WIP... 
