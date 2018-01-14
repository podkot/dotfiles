# dotfiles

Install on a server with `sshrc [server]`.

Local installation:

```bash
\curl -L https://raw.githubusercontent.com/podkot/dotfiles/master/install | bash
```

macos prerequisites:

```bash
xcode-select --install
```

ubuntu prerequisites:

```bash
sudo apt-get install curl git
```

known bugs:

- marker: [read: read error: 0: Input/output error](https://github.com/pindexis/marker/issues/34)

## [commands](COMMANDS.md)

## [keys](KEYS.md)

## \*rc.d

Don't forget to setup `~/.bashrc_vars`

rc.d folders:

- `bashrc.d` - scripts that run at `bash` startup
- `shrc.d` - scripts that run at both `bash` and `zsh` startup
- `vimrc.d` - vim-scripts that run at `vim` startup
- `zshrc.d` - scripts that run at `zsh` startup

\*shrc.d scripts:

- `-mac.sh` - scripts that run only on macOS
- `-linux.sh` - scripts that run only on Linux
- `-desktop.sh` - scripts that don't run in ssh session

## sources

- [sapegin/dotfiles](https://github.com/sapegin/dotfiles)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [powerline/fonts](https://github.com/powerline/fonts)
- [grigio/vim-sublime](https://github.com/grigio/vim-sublime)
- [Bash-it/bash-it](https://github.com/Bash-it/bash-it)
- [github/gitignore](https://github.com/github/gitignore)
- and many more.

