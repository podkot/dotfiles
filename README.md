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

## bashrc.d

Don't forget to setup `~/.bashrc_vars`

- `bashrc.d` - scripts, running at `bash` startup
- `shrc.d` - scripts, running at both `bash` and `zsh` startup
- `zshrc.d` - scripts, running at `zsh` startup

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

