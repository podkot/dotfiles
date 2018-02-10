export EDITOR="subl -w"

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Use homebrew GNU coreutils if available (on osx)
if [ -d /usr/local/opt/coreutils/libexec ]; then
  PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

# export PKG_CONFIG_PATH="`brew --prefix cairo`/lib/pkgconfig:/usr/local/opt/pixman/lib/pkgconfig:/usr/local/opt/fontconfig/lib/pkgconfig:/usr/local/opt/freetype/lib/pkgconfig:/usr/local/opt/libpng/lib/pkgconfig:/usr/X11/lib/pkgconfig"

export HOMEBREW_CASK_OPTS='--appdir=/Applications'
