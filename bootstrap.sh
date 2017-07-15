#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
  rsync --exclude ".git/" --exclude "bootstrap.sh" \
    --exclude "Makefile" --exclude "screenshot/" \
    --exclude "README.md" --exclude "alpine/" \
    --exclude "freebsd/" \
    -avh --no-perms . ~;
  source ~/.bashrc;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;

unset doIt;

[ -d "${HOME}/bin" ] || mkdir ~/bin

# download z.sh (https://github.com/rupa/z)
[ -f "${HOME}/z.sh" ] && rm -rf ${HOME}/z.sh
curl -L "https://raw.githubusercontent.com/rupa/z/master/z.sh" -o ~/z.sh
chmod +x ~/z.sh

# download git-blame-someone-else (https://github.com/jayphelps/git-blame-someone-else)
curl -o ~/bin/git-blame-someone-else "https://raw.githubusercontent.com/jayphelps/git-blame-someone-else/master/git-blame-someone-else"
chmod +x ~/bin/git-blame-someone-else

# download diff-so-fancy (https://github.com/so-fancy/diff-so-fancy)
[ -d "~/bin/lib" ] || mkdir -p ~/bin/lib
curl -o ~/bin/lib/DiffHighlight.pm https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/lib/DiffHighlight.pm
curl -o ~/bin/diff-so-fancy "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/diff-so-fancy"
chmod +x ~/bin/diff-so-fancy

# download git-mv-with-history
curl -o ~/bin/git-mv-with-history "https://gist.githubusercontent.com/emiller/6769886/raw/git-mv-with-history"
chmod +x ~/bin/git-mv-with-history

# See your latest local git branches, formatted real fancy
# https://github.com/paulirish/git-recent
curl -o ~/bin/git-recent "https://raw.githubusercontent.com/paulirish/git-recent/master/git-recent"
chmod +x ~/bin/git-recent

# Type `git open` to open the GitHub page or website for a repository in your browser.
# https://github.com/paulirish/git-open
curl -o ~/bin/git-open "https://raw.githubusercontent.com/paulirish/git-open/master/git-open"
chmod +x ~/bin/git-open

# Recall what you did on the last working day. Psst! or be nosy and find what someone else in your team did ;-)
# https://github.com/kamranahmedse/git-standup
curl -o ~/bin/git-standup "https://raw.githubusercontent.com/kamranahmedse/git-standup/master/git-standup"
chmod +x ~/bin/git-standup

# Git quick statistics is a simple and efficient way to access various statistics in git repository.
# https://github.com/arzzen/git-quick-stats
curl -o ~/bin/git-quick-stats "https://raw.githubusercontent.com/arzzen/git-quick-stats/master/git-quick-stats"
chmod +x ~/bin/git-quick-stats

# Simple and handy tool to easily recall what you've done
# https://github.com/Fakerr/git-recall
curl -o ~/bin/git-recall "https://raw.githubusercontent.com/Fakerr/git-recall/master/git-recall"
chmod +x ~/bin/git-recall

# Get the password of the wifi you're on (bash)
# https://github.com/rauchg/wifi-password
curl -L https://raw.github.com/rauchg/wifi-password/master/wifi-password.sh -o ~/bin/wifi-password
chmod +x ~/bin/wifi-password
