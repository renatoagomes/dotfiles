# Repo com minhas configurações do .vimrc

### Copy/Paste sh

Plugins foram instalados utilizando o [vim-pathogen](https://github.com/tpope/vim-pathogen).

``` sh
git clone https://github.com/renatoagomes/vimrc.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
```

### Atual:

![Imgur](http://i.imgur.com/6PGAk1s.png)

### Plugins

* [emmet-vim](https://github.com/mattn/emmet-vim)  - Emmet para html / outros
* [nerdtree](https://github.com/scrooloose/nerdtree) - NERDTree :D
* [supertab](https://github.com/ervandew/supertab/) - Autocomplete com tab 
* [ultisnips](https://github.com/SirVer/ultisnips) - Snippets snipets snipets..
* [vim-snippets](https://github.com/honza/vim-snippets.git) - Snippets/Autocomplete para n³³ linguagens 
* [vim-airline](https://github.com/vim-airline/vim-airline) - Bottom Bar amigavel
* [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes) - Estilizando a Bottom Bar 
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter) - Avisa arquivos / linhas moificadas do git
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors/) - Editar multiplas linhas
* [vim-php-namespace](https://github.com/arnaud-lb/vim-php-namespace) - Autocomplete namespace / use statements
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) - CtrlP (fuzzy search, lista de metodos, etc..)
* [vimwiki](https://github.com/vimwiki/vimwiki) - Wiki / Diario / TODOs
* [syntastic](https://github.com/vim-syntastic/syntastic) - Syntax checker p/ tudo
* [pdv](https://github.com/tobyS/pdv) - PHP Documentor for VIM (gera docblocks)
* [vmustache](https://github.com/tobyS/vmustache) - Vmustache template system p/ VIM (required p/ pdv)
* [vim-wakatime](https://github.com/wakatime) - Tentativa de TimeTracker automatico o/

### TODO:

* Acertar submodules e usar o Pathogen direito: [How-to use Tim Pope's Pathogen](https://gist.github.com/romainl/9970697)
* Snippets / Acertar ultisnips para o laravel
* Acertar mappings do vimwiki para facilitar a navegacao entre todo-lists etc..
* Acertar outros checkers do syntastic (PATH / style PSR checkers / syntax highlight para react / blade)

