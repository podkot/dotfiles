# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# servers
alias apache-stop="sudo httpd -k stop"
alias apache-start="sudo httpd -k start"
alias apache-restart="sudo httpd -k restart"
alias apache-conf="$EDITOR /usr/local/etc/apache2/$APACHE_VERSION/httpd.conf" # httpd -V | grep 'SERVER_CONFIG_FILE'


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


alias phpini="$EDITOR /usr/local/etc/php/$PHP_VERSION/php.ini" # php -i | grep 'Configuration File'
alias vhosts="$EDITOR /usr/local/etc/apache2/$APACHE_VERSION/extra/httpd-vhosts.conf"


