#!/usr/bin/env bash

export EDITOR="subl"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PKG_CONFIG_PATH="`brew --prefix cairo`/lib/pkgconfig:/usr/local/opt/pixman/lib/pkgconfig:/usr/local/opt/fontconfig/lib/pkgconfig:/usr/local/opt/freetype/lib/pkgconfig:/usr/local/opt/libpng/lib/pkgconfig:/usr/X11/lib/pkgconfig"

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
# source $(brew --prefix nvm)/etc/bash_completion.d/nvm
# [[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

# php-version
source $(brew --prefix php-version)/php-version.sh && php-version 5

# completion
# if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
#     . $(brew --prefix)/share/bash-completion/bash_completion
# fi

## git
#[[ -s "/usr/local/etc/bash_completion.d/git-completion.bash" ]] && source "/usr/local/etc/bash_completion.d/git-completion.bash"
## homebrew
#source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"

# brew data
alias brew-save="brew ls > $DOTFILES/data/brew-ls.txt && brew tap > $DOTFILES/data/brew-tap.txt"
alias brew-restore="cat $DOTFILES/data/brew-tap.txt | brew tap && cat $DOTFILES/data/brew-ls.txt | brew install"

# configs
alias phpini="$EDITOR /usr/local/etc/php/5.6/php.ini" # php -i | grep 'Configuration File'
alias vhosts="$EDITOR /usr/local/etc/apache2/2.4/extra/httpd-vhosts.conf"

# servers
alias apache-conf="$EDITOR /usr/local/etc/apache2/2.4/httpd.conf" # httpd -V | grep 'SERVER_CONFIG_FILE'
alias apache-stop="sudo httpd -k stop"
alias apache-start="sudo httpd -k start"
alias apache-restart="sudo httpd -k restart"

alias memcached-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist"
alias memcached-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist"
alias memcached-restart="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist"

alias redis-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
alias redis-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
alias redis-restart="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"

alias mysql-conf="$EDITOR /usr/local/etc/my.cnf.d/server.cnf"
alias mysql-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist"
alias mysql-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist"
alias mysql-restart="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mariadb.plist"

