if [[ `uname` == 'Darwin' ]]; then
    if [[ -e $(which brew 2>/dev/null) ]]; then
        BASHCOMPLETE_DIR="$(brew --prefix)/etc/profile.d"

       if [[ -r "$BASHCOMPLETE_DIR/bash_completion.sh" ]]; then
         . "$BASHCOMPLETE_DIR/bash_completion.sh"
       fi
    fi

    if [[ -e $(which aws 2>/dev/null) ]]; then
      complete -C aws_completer aws
    fi

    if [[ -e $(which fzf 2>/dev/null) ]]; then
      eval "$(fzf --bash)"
    fi
fi
