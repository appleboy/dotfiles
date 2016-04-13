#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
  rsync --exclude ".git/" --exclude "bootstrap.sh" \
    --exclude "README.md" --exclude "screenshot/" \
    --exclude "freebsd/" --exclude "alpine/" \
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
curl -o ~/z.sh "https://raw.githubusercontent.com/rupa/z/master/z.sh"

# download git-blame-someone-else (https://github.com/jayphelps/git-blame-someone-else)
curl -o ~/bin/git-blame-someone-else "https://raw.githubusercontent.com/jayphelps/git-blame-someone-else/master/git-blame-someone-else"
chmod 755 ~/bin/git-blame-someone-else

# download diff-so-fancy (https://github.com/stevemao/diff-so-fancy)
[ -d "~/bin/lib" ] || mkdir -p ~/bin/lib
curl -o ~/bin/lib/diff-so-fancy.pl "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/lib/diff-so-fancy.pl"
curl -o ~/bin/diff-highlight "https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight"
curl -o ~/bin/diff-so-fancy "https://raw.githubusercontent.com/stevemao/diff-so-fancy/master/diff-so-fancy"
chmod 755 ~/bin/lib/diff-so-fancy.pl
chmod 755 ~/bin/diff-highlight
chmod 755 ~/bin/diff-so-fancy

# download git-mv-with-history
curl -o ~/bin/git-mv-with-history "https://gist.githubusercontent.com/emiller/6769886/raw/git-mv-with-history"
chmod 755 ~/bin/git-mv-with-history
