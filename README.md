# DOTFILES 

Currently using:
- manjaro
- i3wm
- neovim


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

### NEOVIM

```
cd ~/.config
ln -s ~/dotfiles/nvim ./
```
