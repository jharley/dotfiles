if [[ `uname` == 'Darwin' ]]; then
    GOPATH=${HOME}/work

    if [ -d ${GOPATH} ]; then
        export GOPATH
    fi
fi
