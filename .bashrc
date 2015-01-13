# source code from https://github.com/appleboy/config

# short command
alias grep='grep --color=auto'
alias g='grep --color=auto'
alias ls="/bin/ls -aF --color=always"

# common variable
export BLOCKSIZE="k"
export EDITOR="vim"
export GIT_PAGER="less"
export LESS="-EfmrSwX"
export LSCOLORS="gxfxcxdxbxegedabagacad"
export PATH="/usr/local/sbin:/usr/sbin:/sbin:$PATH"

# Add Autocompletion
[ -f "/etc/bash_completion" ] && source "/etc/bash_completion"
[ -f "/usr/local/etc/bash_completion" ] && source "/usr/local/etc/bash_completion"
[ -f "~/.git-completion.bash" ] && source "~/.git-completion.bash"
[ -f "/usr/local/share/git-core/contrib/completion/git-completion.bash" ] && source "/usr/local/share/git-core/contrib/completion/git-completion.bash"
[ -f "~/.gulp-completion.bash" ] && source "~/.gulp-completion.bash"

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

function git_since_last_commit {
    now=`date +%s`;
    last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
    seconds_since_last_commit=$((now-last_commit));
    minutes_since_last_commit=$((seconds_since_last_commit/60));
    hours_since_last_commit=$((minutes_since_last_commit/60));
    minutes_since_last_commit=$((minutes_since_last_commit%60));
    echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}

function git_diff() {
    git diff --no-ext-diff -w "$@" | vim -R -
}

if [ "`uname -s`" == "Linux" ]; then
    alias ls="/bin/ls -aF --color=always"
    alias tmux="TERM=screen-256color /usr/bin/tmux"
else
    alias ls="/bin/ls -aF"
fi

# ps1
if [ -z "$WINDOW" ]; then
    PS1='\[\e[0m\e[33m\]\u\[\e[0m\]@\[\e[36m\]\h\[\e[0m\] [\[\e[33m\]\w\[\e[0m\]] [\[\e[1;36m\]\t\[\e[0m\]] `git_branch`\[\033[0;33m\]`git_since_last_commit`\[\033[0m\]\n$ '
else
    PS1='\[\e[0m\e[32m\]\u\[\e[0m\]@\[\e[36m\]\h\[\e[0m\] [\[\e[32m\]\w\[\e[0m\]] [\[\e[36m\]\A\[\e[0m\]/ \[\e[36m\]W$WINDOW\[\e[0m\]] '
fi

# support https://github.com/creationix/nvm
if [ -f "${HOME}/.nvm/nvm.sh" ]; then
    export NVM_DIR=$HOME/.nvm
    . ~/.nvm/nvm.sh
    nvm use 0.10.33
fi

# support https://github.com/phpbrew/phpbrew
[ -f "~/.phpbrew/bashrc" ] && . ~/.phpbrew/bashrc
# support rvm
[ -f "/etc/profile.d/rvm.sh" ] && . /etc/profile.d/rvm.sh

# init z! (https://github.com/rupa/z)
. ~/z.sh

# support git semantic commits command.
if [ -d "${HOME}/.git-semantic-commits" ]; then
    export PATH=$PATH:${HOME}/.git-semantic-commits
fi

# support composer command
if [ -d "${HOME}/.composer/vendor/bin" ]; then
    export PATH=$PATH:${HOME}/.composer/vendor/bin
fi

# end .bashrc file
