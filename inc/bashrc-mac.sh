#!/usr/bin/env bash

# php-version
# source $(brew --prefix php-version)/php-version.sh && php-version 5


export EDITOR="subl"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PKG_CONFIG_PATH="`brew --prefix cairo`/lib/pkgconfig:/usr/local/opt/pixman/lib/pkgconfig:/usr/local/opt/fontconfig/lib/pkgconfig:/usr/local/opt/freetype/lib/pkgconfig:/usr/local/opt/libpng/lib/pkgconfig:/usr/X11/lib/pkgconfig"

export HOMEBREW_CASK_OPTS='--appdir=/Applications'

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"

# configs
alias phpini="$EDITOR /usr/local/etc/php/7.0/php.ini" # php -i | grep 'Configuration File'
alias vhosts="$EDITOR /usr/local/etc/apache2/2.4/extra/httpd-vhosts.conf"

# npm
alias ni='npm install'
alias nis='npm install --save'
alias nid='npm install --save-dev'
alias nig='npm install --global'
alias nt='npm test'
alias nit='npm install && npm test'
alias nk='npm link'
alias nr='npm run'
alias nf='npm cache clean && rm -rf node_modules && npm install'

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

