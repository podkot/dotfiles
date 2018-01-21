if [ -z "$MC_SID" ]; then
    # required for paulmelnikow/zsh-startup-timer
    command_exists brew && export PYTHONPATH=$(brew --prefix)/lib/python$PYTHON_VERSION/site-packages

    [[ -f ~/.zsh_plugins.sh ]] && source ~/.zsh_plugins.sh
fi
