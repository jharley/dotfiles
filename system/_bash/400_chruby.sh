if [[ -e /usr/local/share/chruby ]]; then
  # Load chruby
  source '/usr/local/share/chruby/chruby.sh'

  # Automatically switch rubies
  source '/usr/local/share/chruby/auto.sh'

  # Set a default ruby if a .ruby-version file exists in the home dir
  if [[ -f ~/.ruby-version ]]; then
    chruby $(cat ~/.ruby-version)
  else
    echo "chruby: no default ruby set, using system ruby"
  fi
fi
