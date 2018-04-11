# DOTFILES FTW :1st_place_medal: 

Atualmente com:
- i3wm
- termite 
- zsh & oh-my-zsh
- vim
- NerdFonts
- ranger
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
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
ln -s ~/dotfiles/zsh/zshrc .zshrc
```

### VIM

```
cd ~
ln -s ~/dotfiles/vim .vim
ln -s ~/dotfiles/vim/vimrc .vimrc
```

### [NerdFonts](https://github.com/ryanoasis/nerd-fonts)

Download das fontes e install:
    - [Fura Mono Medium Nerd Font Complete](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraMono/Medium/complete/Fura%20Mono%20Medium%20Nerd%20Font%20Complete.otf)
    - [Fura Mono Medium Nerd Font Complete Mono](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraMono/Medium/complete/Fura%20Mono%20Medium%20Nerd%20Font%20Complete%20Mono.otf)

```
cd ~/Downloads
sudo mv Fura\ Mono\ Medium\ Nerd\ Font\ Complete.otf /usr/share/fonts/opentype/
sudo mv Fura\ Mono\ Medium\ Nerd\ Font\ Complete\ Mono.otf /usr/share/fonts/opentype/
sudo fc-cache -f -v
```

### Termite

- [termite-install](https://github.com/Corwind/termite-install)

### i3

Instalar i3 / I3Gaps

```
cd ~
ln -s ~/dotfiles/i3 .config/i3
sudo apt-get install i3 python-psutil python-netifaces python-requests python-pip
pip install pyyaml
```

### Ranger

```
sudo apt-get install ranger
```

## @TODO:

- Melhorar readme
- i3
    - i3gaps
    - compton
    - bumblebee-status
