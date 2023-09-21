# source code from https://github.com/appleboy/config

export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="UTF-8"
export LANG="en_US.UTF-8"

# save bash history
# https://superuser.com/questions/950403/bash-history-not-preserved-between-terminal-sessions-on-mac/985099
export SHELL_SESSION_HISTORY=0

# set for mac
export CLICOLOR=1

# common variable
export BLOCKSIZE="k"
export EDITOR="vim"
export GIT_PAGER="less"
export LESS="-EfmrSwX"
export LSCOLORS="dxfxcxdxbxegedabagacad"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"

# Add a timestamp to your bash history
export HISTTIMEFORMAT="%d/%m/%y %T "

# ref: http://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
# https://apple.stackexchange.com/questions/218731/why-bash-history-on-my-mac-wont-save
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000           # big big history
export HISTFILESIZE=100000       # big big history
shopt -s histappend              # append to history, don't overwrite it

# https://www.jianshu.com/p/26d365078081
export BASH_SILENCE_DEPRECATION_WARNING=1

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Add Autocompletion
[ -f "/etc/bash_completion" ] && source "/etc/bash_completion"
[ -f "/usr/local/etc/bash_completion" ] && source "/usr/local/etc/bash_completion"
[ -f "${HOME}/.git-completion.bash" ] && source "${HOME}/.git-completion.bash"
[ -f "/usr/local/share/git-core/contrib/completion/git-completion.bash" ] && source "/usr/local/share/git-core/contrib/completion/git-completion.bash"
[ -f "/opt/homebrew/etc/profile.d/bash_completion.sh" ] && source "/opt/homebrew/etc/profile.d/bash_completion.sh"

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
  source ${HOME}/.nvm/nvm.sh > /dev/null 2>&1
  nvm use stable > /dev/null 2>&1
fi

# support https://github.com/phpbrew/phpbrew
[ -f "${HOME}/.phpbrew/bashrc" ] && source ${HOME}/.phpbrew/bashrc

# init z! (https://github.com/rupa/z)
[ -f "${HOME}/z.sh" ] && source ${HOME}/z.sh

# support git semantic commits command.
if [ -d "${HOME}/.git-semantic-commits" ]; then
  export PATH=$PATH:${HOME}/.git-semantic-commits
fi

# support composer command
if [ -d "${HOME}/.composer/vendor/bin" ]; then
  export PATH=$PATH:${HOME}/.composer/vendor/bin
fi

# add bin folder to $PATH.
if [ -d "${HOME}/bin" ]; then
  export PATH=$PATH:${HOME}/bin
fi

# Add RVM to PATH for scripting
if [ -d "$HOME/.rvm/bin" ]; then
  export PATH="$PATH:$HOME/.rvm/bin"
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file" > /dev/null 2>&1;
done;

unset file;

# end .bashrc file
