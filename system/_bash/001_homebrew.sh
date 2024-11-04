if [ -d /opt/homebrew ]; then
  # Apple Silicon Homebrew
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export HOMEBREW_NO_ENV_HINTS=1
