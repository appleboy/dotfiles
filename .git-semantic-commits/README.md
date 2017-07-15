# Git Semantic Commit Messages

This project is based on [Karma Git Commit Convention](http://karma-runner.github.io/1.0/dev/git-commit-msg.html).
See their commit history for examples of properly-formatted commit messages.

### Commands:

| Command                           | Return                          |
| ---------------------             | ------------------------------- |
| `git feat <message>`              | feat: message                   |
| `git feat <scope> <message>`      | feat(scope): message            |
| `git docs <message>`              | docs: message                   |
| `git docs <scope> <message>`      | docs(scope): message            |
| `git chore <message>`             | chore: message                  |
| `git chore <scope> <message>`     | chore(scope): message           |
| `git fix <message>`               | fix: message                    |
| `git fix <scope> <message>`       | fix(scope): message             |
| `git refactor <message>`          | refactor: message               |
| `git refactor <scope> <message>`  | refactor(scope): message        |
| `git style <message>`             | style: message                  |
| `git style <scope> <message>`     | style(scope): message           |
| `git test <message>`              | test: message                   |
| `git test <scope> <message>`      | test(scope): message            |
| `git localize <message>`          | localize: message               |
| `git localize <scope> <message>`  | localize(scope): message        |


## Manual Installation:

1. Clone this repo, prefferably in your $HOME directory.
```
git clone https://github.com/russiann/git-semantic-commits ~/.git-semantic-commits
```

2. Add the folder to your $PATH.
  * if using Bash, open ```~/.bashrc``` with your favourite editor and add this line:
  ```
  export PATH=$PATH:$HOME/.git-semantic-commits:$PATH
  ```
  * if using Zsh, open ```~/.zshrc``` with your favourite editor and add this line:
  ```
  export PATH=$PATH:$HOME/.git-semantic-commits:$PATH
  ```

3. Save the file and source the changes in bashrc/zshrc: ```source ~/.bashrc``` or ```source ~/.zshrc```

4. Done!
