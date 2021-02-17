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

...


### i3-gaps

```
sudo pacman -S install i3-gaps 
```

### Ranger & ranger dev-icons

```
sudo pacman -S install ranger
```

### Scrot (para prints)

```
sudo pacman -S install scrot
```
