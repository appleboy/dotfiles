# source code from https://github.com/appleboy/config
# Add Git Autocompletion

[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash

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


#
if [ -z "$WINDOW" ]; then
    PS1='\[\e[0m\e[33m\]\u\[\e[0m\]@\[\e[36m\]\h\[\e[0m\] [\[\e[33m\]\w\[\e[0m\]] [\[\e[36m\]\A\[\e[0m\]] `git_branch`\[\033[0;33m\]`git_since_last_commit`\[\033[0m\]$ '
else
    PS1='\[\e[0m\e[32m\]\u\[\e[0m\]@\[\e[36m\]\h\[\e[0m\] [\[\e[32m\]\w\[\e[0m\]] [\[\e[36m\]\A\[\e[0m\]/ \[\e[36m\]W$WINDOW\[\e[0m\]] '
fi
bind '"\x1b\x5b\x41":history-search-backward'
bind '"\x1b\x5b\x42":history-search-forward'
# end .bashrc file 
