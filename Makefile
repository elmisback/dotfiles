# Run from Makefile directory
.PHONY: all
all: install

.PHONY: debug
debug:
	echo $(XDG_CONFIG_HOME)	
	echo $(XDG_CACHE_HOME)	

.PHONY: links
links:
	# Make sure $(XDG_CONFIG_HOME) exists first.
	mkdir -p $(XDG_CONFIG_HOME)

	stow --target=$(XDG_CONFIG_HOME) pkg

.PHONY: plugins
plugins:
	printf "  vim-plug... "
	curl -fLo $(XDG_CACHE_HOME)/vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.PHONY: home
home:
	ln -sf $(PWD)/pkg/zsh/.zshenv $(HOME)/.zshenv

.PHONY: uninstall
uninstall:
	rm -rf $(XDG_CONFIG_HOME)
	rm -rf $(XDG_CACHE_HOME)
	rm -f $(HOME)/.zshenv

.PHONY: install
install: links plugins home
