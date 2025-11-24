export ASDF_DATA_DIR="${HOME}/.asdf"

ASDF_PLUGINS="golang python java maven nodejs terraform ruby"
if [[ $(uname) == 'Darwin' ]]; then
    if [[ -e $(which asdf 2>/dev/null) ]]; then
        INSTALLED_PLUGINS=$(asdf plugin list)
        for plugin in $ASDF_PLUGINS; do
          if ! echo "$INSTALLED_PLUGINS" | grep -qw "$plugin" 2>/dev/null 1>&2; then
            asdf plugin add "$plugin"
          fi
        done

        . <(asdf completion bash)
    fi
fi

if [ -f ~/.asdf/plugins/golang/set-env.bash ]; then
  . ${ASDF_DATA_DIR}/plugins/golang/set-env.bash
  export ASDF_GOLANG_MOD_VERSION_ENABLED=false

  # run the env adjustment function each prompt invocation
  if ! [[ "${PROMPT_COMMAND:-}" =~ asdf_update_golang_env ]]; then
    PROMPT_COMMAND="asdf_update_golang_env${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
  fi
fi

if [ -f ${ASDF_DATA_DIR}/plugins/java/set-java-home.bash ]; then
  . ${ASDF_DATA_DIR}/plugins/java/set-java-home.bash
fi

export PATH="${ASDF_DATA_DIR}/shims:$PATH"
