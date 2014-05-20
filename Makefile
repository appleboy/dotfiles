.PHONY: clean linux freebsd git tmux

is_bashrc := $(shell grep "github.com" ~/.bashrc)
filetime := $(shell date '+%s%N')

all:
	@echo "make linux for linux version"
	@echo "make freebsd for freebsd version"

linux: git tmux
ifeq ($(is_bashrc),)
	@cat .bashrc >> ~/.bashrc;
endif
	wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ${HOME}/.git-completion.bash
	wget https://raw.githubusercontent.com/gulpjs/gulp/master/completion/bash -O ${HOME}/.gulp-completion.bash
	[ -f "${HOME}/.inputrc" ] && mv "${HOME}/.inputrc" "${HOME}/.inputrc.${filetime}"
	[ -f "${HOME}/.my.cnf" ] && mv "${HOME}/.my.cnf" "${HOME}/.my.cnf.${filetime}"
	[ -f "${HOME}/z.sh" ] && mv "${HOME}/z.sh" "${HOME}/z.sh.${filetime}"
	[ -f "${HOME}/.profile" ] && mv "${HOME}/.profile" "${HOME}/.profile.${filetime}"
	[ ! -f "~/.inputrc" ] && cp .inputrc ~/
	[ ! -f "~/.my.cnf" ] && cp .my.cnf ~/
	[ ! -f "~/z.sh" ] && cp z.sh ~/
	[ ! -f "~/.profile" ] && cp $@/.profile ~/
	@echo "Install $@ version compeletely !!!"

freebsd: git tmux
	fetch -o ${HOME}/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
	fetch -o ${HOME}/.gulp-completion.bash https://raw.githubusercontent.com/gulpjs/gulp/master/completion/bash
	[ ! -f "~/.profile" ] && cp $@/.profile ~/
	[ ! -f "~/z.sh" ] && cp $@/z.sh ~/
	[ ! -f "/etc/make.conf" ] && cp $@/make.conf /etc/
	[ ! -f "${HOME}/.cshrc" ] && cp .cshrc ${HOME}/
	@echo "Install $@ version compeletely !!!"

git:
	[ -f "${HOME}/.gitconfig" ] && mv "${HOME}/.gitconfig" "${HOME}/.gitconfig.${filetime}"
	[ ! -f "~/.gitconfig" ] && cp .gitconfig ~/
	@echo "copy .gitconfig to home folder !!"

tmux:
	[ ! -f "~/.tmux.conf" ] && cp .tmux.conf ~/
	@echo "copy .tmux.conf to home folder !!"

clean:
	@rm -rf ~/.gitconfig
	@echo "clear .gitconfig"
