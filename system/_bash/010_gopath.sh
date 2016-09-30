if [[ `uname` == 'Darwin' ]]; then
    GOPATH=${HOME}/work

    if [ -d ${GOPATH} ]; then
        export GOPATH
        export PATH=$PATH:$GOPATH/bin
    fi
fi
