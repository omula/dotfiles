DATE := $(date "+%Y%m%d")
FULLDATE := $(date "+%Y%m%d")
DOTFILES := $(shell pwd)
OLDDOTFILES := ~/dotfiles_${DATE}               # old dotfiles backup directory

all: vim vim_extras bash git python
.PHONY : vim vim_extras bash git python

vim:
	rm -rf ~/.vimrc
	ln -s $(DOTFILES)/.vimrc ~/.vimrc

vim_extras:
	mkdir -p ~/.vim/bundle
	test -d ~/.vim/bundle/Vundle.vim || \
	(git clone --quiet https://github.com/gmarik/vundle.git \
	~/.vim/bundle/Vundle.vim && \
	vim +BundleInstall +qall > /dev/null)

bash:
	rm -f ~/.bashrc
	rm -f ~/.bash_ps1
	rm -f ~/.bash_aliases
	ln -s $(DOTFILES)/.bashrc ~/.bashrc
	ln -s $(DOTFILES)/.bashrc ~/.bash_ps1
	ln -s $(DOTFILES)/.bash_aliases ~/.bash_aliases

git:
	rm -f ~/.gitconfig
	ln -s $(DOTFILES)/.gitconfig ~/.gitconfig

python: pyenv

pyenv:
	test -d ~/.pyenv || \
	git clone --quiet https://github.com/yyuu/pyenv.git ~/.pyenv && \
	git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
