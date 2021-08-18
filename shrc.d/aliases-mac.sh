# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

alias flushdns="sudo killall -HUP mDNSResponder; sleep 2; echo macOS DNS Cache Reset | say"

# delete local time machine snapshots
# https://forums.macrumors.com/threads/how-to-delete-time-machine-local-backups-on-high-sierra.2073998/
function rmsnaps(){
    tmutil  listlocalsnapshotdates / |grep 20|while read f; do tmutil deletelocalsnapshots $f; done
}

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# servers
alias apache-stop="sudo httpd -k stop"
alias apache-start="sudo httpd -k start"
alias apache-restart="sudo httpd -k restart"
alias apache-conf="$EDITOR /usr/local/etc/httpd/httpd.conf" # httpd -V | grep 'SERVER_CONFIG_FILE'


alias memcached-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist"
alias memcached-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist"
alias memcached-restart="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist"

alias redis-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
alias redis-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
alias redis-restart="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist && launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"

alias mysql-conf="$EDITOR /usr/local/etc/my.cnf.d/server.cnf"
alias mysql-stop="brew services stop mariadb"
alias mysql-start="brew services start mariadb"
alias mysql-restart="brew services restart mariadb"


alias phpini="$EDITOR /usr/local/etc/php/8.0/php.ini" # php -i | grep 'Configuration File'
alias vhosts="$EDITOR /usr/local/etc/httpd/extra/httpd-vhosts.conf"


