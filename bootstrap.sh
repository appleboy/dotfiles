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
