if [[ `uname` == 'Darwin' ]]; then
    if [[ -e $(which direnv 2>/dev/null) ]]; then
	eval "$(direnv hook bash)"
    fi
fi
