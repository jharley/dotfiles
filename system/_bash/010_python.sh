if [[ `uname` == 'Darwin' ]]; then
    if [[ -e $(which brew 2>/dev/null) ]]; then
        PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages

        if [ -d ${PYTHONPATH} ]; then
            export PYTHONPATH
        fi
    fi
fi
