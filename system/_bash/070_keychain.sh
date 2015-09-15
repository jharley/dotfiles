# Learn more about 'keychain' at http://www.funtoo.org/Keychain

# load keychain if we're interactive
fd=0
if [[ -t "$fd" || -p /dev/stdin || ! -z $PS1 ]]; then
    if which keychain 2>&1 > /dev/null; then
        KEYCHAIN=$(which keychain)
        if [ -f ~/.mykeychain ]; then
            source ~/.mykeychain

            eval `${KEYCHAIN} --eval --agents ssh --inherit any-once ${KEYS}`
            alias clear-keychain="${KEYCHAIN} --inherit any-once --clear"
        else
            # ~/.mykeychain contains 'KEYS' which is a list
            # of private keys to load
            # e.g. KEYS=" ${HOME}/.ssh/id_dsa ${HOME}/.ssh/github_rsa "
            #
            # NOTE: the spaces at the beginning and end are critical!
            echo "\"~/.mykeychain\" missing; not loading keychain"
        fi
    fi
fi
