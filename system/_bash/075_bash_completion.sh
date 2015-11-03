if [[ `uname` == 'Darwin' ]]; then
    if [[ -e $(which brew 2>/dev/null) ]]; then
        BASHCOMPLETE_DIR="$(brew --prefix)/etc/bash_completion.d"

        if [ -d $BASHCOMPLETE_DIR ]; then
             for f in $BASHCOMPLETE_DIR/*; do
                source $f
            done
        fi
    fi
fi
