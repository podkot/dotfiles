# dotfiles

while on mac, `xcode-select --install` first. then:

```bash
\curl -L https://raw.githubusercontent.com/podkot/dotfiles/master/install | bash
```

## commands

`ag [FILE-TYPE] [OPTIONS] PATTERN [PATH]` - [the_silver_searcher](https://github.com/ggreer/the_silver_searcher), a code searching tool similar to ack, with a focus on speed  
`fuck` - [thefuck](https://github.com/nvbn/thefuck) corrects your previous console command  
`licen mit > LICENSE` - [licen](https://github.com/lord63/licen) generates license files  

## keys

__bash [fzf](https://github.com/junegunn/fzf)__  
<kbd>ctrl</kbd> <kbd>t</kbd> - Paste the selected files and directories onto the command line  
<kbd>ctrl</kbd> <kbd>r</kbd> - Paste the selected command from history onto the command line. Sort is disabled by default to respect chronological ordering. Press <kbd>ctrl</kbd> <kbd>r</kbd> again to toggle sort  
<kbd>alt</kbd> <kbd>c</kbd> - cd into the selected directory  

__[tig](http://jonas.nitro.dk/tig/manual.html#keys)__  

## vim

__[ag](https://github.com/rking/ag.vim)__  
`:Ag [options] {pattern} [{directory}]`  
In the quickfix window, you can use:  
<kbd>e</kbd> to open file and close the quickfix window  
<kbd>o</kbd> to open (same as enter)  
<kbd>go</kbd> to preview file (open but maintain focus on ag.vim results)  
<kbd>t</kbd> to open in new tab  
<kbd>T</kbd> to open in new tab silently  
<kbd>q</kbd> to close the quickfix window  

## sources

- [sapegin/dotfiles](https://github.com/sapegin/dotfiles)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [powerline/fonts](https://github.com/powerline/fonts)
- [grigio/vim-sublime](https://github.com/grigio/vim-sublime)
- [Bash-it/bash-it](https://github.com/Bash-it/bash-it)
- [github/gitignore](https://github.com/github/gitignore)
- and many more.

