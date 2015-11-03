if [[ `uname` == 'Darwin' ]]; then
    if [[ -d $(brew --prefix nvm 2>/dev/null) ]]; then
        export NVM_DIR=~/.nvm

        source $(brew --prefix nvm)/nvm.sh

        # Set a default node if a ~/.nvmrc file exists
        if [ -f ~/.nvmrc ]; then
            nvm use 2>&1 >/dev/null
        else
            echo "nvm: no default node set"
        fi
    fi
fi
