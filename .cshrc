# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available at /usr/share/examples/csh/
#

alias h         history 25
alias j         jobs -l
alias la        ls -aF
alias lf        ls -FA
alias ll        ls -lAF

alias SYNC "/bin/sync; /bin/sync; /bin/sync"
alias bye "logout"
alias c "cls"
alias cd.. "cd .."
alias cd... "cd ../.."
alias cls "/usr/bin/tput clear"
alias d "ls -l"
alias dir "ls -l"
alias dir/p "ls -l \!* | less"
alias f "finger"
alias g "/usr/bin/grep --color --mmap"
alias l "/usr/bin/last \!* | less"
alias ls "ls -aFGg"
alias m "more"
alias more "less"
alias psa "ps -awx"
alias psm "psu $USER"
alias psr "psu root"
alias psu "/bin/ps -w -U \!* | less -EmrSw"
alias s "/usr/local/bin/screen"
alias ssh "/usr/bin/ssh -4 -C -e none -o ForwardAgent=yes"
alias t "telnet"


# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)

setenv  EDITOR  vi
setenv  PAGER   more
setenv  BLOCKSIZE       K

if ($?prompt) then
    # An interactive shell -- set some stuff up
    if ($uid == 0) then
            set user = root
    endif
    set prompt = "%n@%m:%/ %# "
    set promptchars = "%#"

    set filec
    set history = 1000
    set savehist = (1000 merge)
    set autolist = ambiguous
    # Use history to aid expansion
    set autoexpand
    set autorehash
    set mail = (/var/mail/$USER)
    if ( $?tcsh ) then
            bindkey "^W" backward-delete-word
            bindkey -k up history-search-backward
            bindkey -k down history-search-forward
    endif
endif

if ( ! $?WINDOW ) then
    set prompt = "[%{^[[1;33m%}%U`hostname -s`%u%{^[[0m%}][%{^[[1;35m%}%U%n%u%{^[[0m%}][ %{^[[1;36m%}%~%{^[[0m%} ]%B%#%b "
else
    set prompt = "[%{^[[1;33m%}%U`hostname -s`%u%{^[[0m%}][%{^[[1;35m%}%U%n%u%{^[[0m%}][%BW$WINDOW%b][ %{^[[1;36m%}%~%{^[[0m%} ]%B%#%b "
endif

setenv ENABLE_STARTUP_LOCALE zh_TW.UTF-8
setenv LC_CTYPE is_IS.ISO_8859-1
setenv LANG zh_TW.UTF-8
setenv LC_ALL zh_TW.UTF-8
setenv EDITOR "/usr/local/bin/vim"
setenv LESS "-EfmrSw"
setenv LSCOLORS "gxfxcxdxbxegedabagacad"
setenv VISUAL $EDITOR

# Add Autocompletion
[ -f "/etc/bash_completion" ] && source "/etc/bash_completion"
[ -f "/usr/local/etc/bash_completion" ] && source "/usr/local/etc/bash_completion"
[ -f "~/.git-completion.bash" ] && source "~/.git-completion.bash"
[ -f "/usr/local/share/git-core/contrib/completion/git-completion.bash" ] && source "/usr/local/share/git-core/contrib/completion/git-completion.bash"
