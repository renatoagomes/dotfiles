# DOTFILES 

- manjaro-i3
- i3wm
- urxvt
- zsh & oh-my-zsh & powerlevel10k
- nvim
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

# zsh && [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) && powerlevel10k

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

