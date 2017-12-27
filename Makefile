# Run from Makefile directory

.PHONY: all
all: install

.PHONY: debug
debug:
	echo $(XDG_CONFIG_HOME)
	echo $(XDG_CACHE_HOME)

.PHONY: links
links:
	# Creating $(XDG_CONFIG_HOME) if it doesn't already exist...
	mkdir -p $(XDG_CONFIG_HOME)

	# Stowing links...
	stow --target=$(XDG_CONFIG_HOME) pkg

.PHONY: plugins
plugins:
	printf "  vim-plug... "
	curl -fLo $(XDG_CACHE_HOME)/vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.PHONY: home
home:
	ln -sf $(CURDIR)/home/xiwirc $(HOME)/.xiwirc
	ln -sf $(CURDIR)/home/octaverc $(HOME)/.octaverc
	ln -sf $(CURDIR)/home/profile $(HOME)/.profile
	ln -sf $(CURDIR)/home/bash_profile $(HOME)/.bash_profile
	ln -sf $(CURDIR)/home/bash_profile $(HOME)/.bashrc
	mkdir -p $(HOME)/.ssh
	ln -sf $(CURDIR)/pkg/ssh/config $(HOME)/.ssh/config
	ln -sf $(CURDIR)/pkg/zsh/zshenv $(HOME)/.zshenv

.PHONY: uninstall
uninstall:
	rm -rf $(XDG_CONFIG_HOME)
	rm -rf $(XDG_CACHE_HOME)
	rm -f $(HOME)/.zshenv

# HACK help dev-env figure out whether to install dotfiles
lockfile:
	touch lockfile

clean:
	rm -f lockfile

.PHONY: install
install: links plugins home lockfile
