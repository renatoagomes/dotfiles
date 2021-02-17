# DOTFILES FTW :1st_place_medal: 

- arch
- i3wm
- urxvt
- zsh & oh-my-zsh & powerlevel10k
- vim & nvim
- NerdFonts 
- ranger
- scrot & feh
 
...

# Copy / Paste

```
cd ~
git clone https://github.com/renatoagomes/dotfiles.git --recursive
cd dotfiles
```

# zsh && [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

Depende do `curl`

```
cd ~
sudo pacman -S zsh
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

### i3

Instalar i3 / I3Gaps (ref: https://terminalroot.com.br/2019/01/ubuntu-i3gaps-albert-cava-polybar.html)

```
sudo apt install git libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev -y && git clone https://www.github.com/Airblader/i3 i3-gaps && cd i3-gaps && autoreconf --force --install && rm -rf build/ && mkdir -p build && cd build/ && ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers && make && sudo make install
```


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

### Scrot (para prints)

```
sudo apt-get install scrot
```
