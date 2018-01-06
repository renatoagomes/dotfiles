# DOTFILES FTW :1st_place_medal: 

Atualmente com:
- i3wm
- termite 
- zsh & oh-my-zsh
- vim
- NerdFonts
...

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
ln -s ~/dotfiles/zsh/zshrc .zshrc
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

Instalar i3 / I3Gaps

```
cd ~
ln -s ~/dotfiles/i3 .config/i3
sudo apt-get install i3 python-psutil python-netifaces python-requests python-pip
pip install pyyaml
```

# @TODO:

- Melhorar readme
- i3
    - i3gaps
    - compton
    - bumblebee-status
