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

## [commands](COMMANDS.md)

## [keys](KEYS.md)

## [iTerm2 integration](https://iterm2.com/documentation-shell-integration.html):

- You can right-click on a filename (e.g., in the output of ls) and select Download with scp from hostname**, and iTerm2 will download the file for you.
- If you drop a file (e.g., from Finder) into iTerm2 while holding the option key, iTerm2 will offer to upload the file via scp to the remote host into the directory you were in on the line you dropped the file on.

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

