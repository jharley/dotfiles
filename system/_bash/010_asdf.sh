ASDF_PLUGINS="golang python nodejs terraform ruby yarn"

if [[ `uname` == 'Darwin' ]]; then
    if [[ -e $(which asdf 2>/dev/null) ]]; then
	. $(brew --prefix asdf)/libexec/asdf.sh

	for plugin in $ASDF_PLUGINS; do
          if ! asdf list $plugin 2>/dev/null 1>&2; then
            asdf plugin-add $plugin
          fi
	done
    fi
fi
