is_bashrc := $(shell grep "github.com" ~/.bashrc)

all:
	@echo "make linux for linux version"
	@echo "make freebsd for freebsd version"
linux: git
ifeq ($(is_bashrc),)
	@cat .bashrc >> ~/.bashrc;
endif
	@echo "Install $@ version compeletely !!!"

freebsd: git
	@echo "Install $@ version compeletely !!!"

git:
	[ ! -f "~/.git-completion.bash" ] && cp .git-completion.bash ~/
	[ ! -f "~/.gitconfig" ] && cp .gitconfig ~/
	@echo "copy .git-completion.bash and .gitconfig to home folder !!"

clean:
	@rm -rf ~/.git-completion.bash ~/.gitconfig
	@echo "clear .git-completion.bash and .gitconfig"

