export PREFIX="${PREFIX:-/usr/local}"
if [ -n \"\$BASH_VERSION\" ] || [ -n \"\$ZSH_VERSION\" ]; then
    if [[ -f $PREFIX/share/chruby/chruby.sh ]]; then
        source $PREFIX/share/chruby/chruby.sh
        # source $PREFIX/share/chruby/auto.sh
        chruby 2.2
    fi
fi
