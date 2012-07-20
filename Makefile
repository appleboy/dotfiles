is_bashrc := $(shell grep "github.com" ~/.bashrc)

all:
	@echo "make linux for linux version"
	@echo "make freebsd for freebsd version"

linux: git tmux
ifeq ($(is_bashrc),)
	@cat .bashrc >> ~/.bashrc;
endif
	@echo "Install $@ version compeletely !!!"

freebsd: git tmux
	@echo "Install $@ version compeletely !!!"

git:
	[ ! -f "~/.gitconfig" ] && cp .gitconfig ~/
	@echo "copy .gitconfig to home folder !!"

tmux:
	[ ! -f "~/.tmux.conf" ] && cp .tmux.conf ~/
	@echo "copy .tmux.conf to home folder !!"

clean:
	@rm -rf ~/.gitconfig
	@echo "clear .gitconfig"
