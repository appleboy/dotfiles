# source code from https://github.com/appleboy/config

# set for mac
export CLICOLOR=1

# common variable
export BLOCKSIZE="k"
export EDITOR="vim"
export GIT_PAGER="less"
export LESS="-EfmrSwX"
export LSCOLORS="dxfxcxdxbxegedabagacad"
export PATH="/usr/local/sbin:/usr/sbin:/sbin:$PATH"

HISTFILESIZE=100000

# Add Autocompletion
[ -f "/etc/bash_completion" ] && source "/etc/bash_completion"
[ -f "/usr/local/etc/bash_completion" ] && source "/usr/local/etc/bash_completion"
[ -f "${HOME}/.git-completion.bash" ] && source "${HOME}/.git-completion.bash"
[ -f "/usr/local/share/git-core/contrib/completion/git-completion.bash" ] && source "/usr/local/share/git-core/contrib/completion/git-completion.bash"

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

# support https://github.com/creationix/nvm
if [ -f "${HOME}/.nvm/nvm.sh" ]; then
    export NVM_DIR=$HOME/.nvm
    source ${HOME}/.nvm/nvm.sh
    nvm use stable
fi

# support https://github.com/phpbrew/phpbrew
[ -f "${HOME}/.phpbrew/bashrc" ] && source ${HOME}/.phpbrew/bashrc
# support rvm
[ -f "/etc/profile.d/rvm.sh" ] && source /etc/profile.d/rvm.sh

# init z! (https://github.com/rupa/z)
source ${HOME}/z.sh

# support git semantic commits command.
if [ -d "${HOME}/.git-semantic-commits" ]; then
    export PATH=$PATH:${HOME}/.git-semantic-commits
fi

# support composer command
if [ -d "${HOME}/.composer/vendor/bin" ]; then
    export PATH=$PATH:${HOME}/.composer/vendor/bin
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

unset file;

# end .bashrc file
