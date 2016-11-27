# bash

__[fzf](https://github.com/junegunn/fzf)__  
<kbd>ctrl</kbd> <kbd>t</kbd> - Paste the selected files and directories onto the command line  
<kbd>ctrl</kbd> <kbd>r</kbd> - Paste the selected command from history onto the command line. Sort is disabled by default to respect chronological ordering. Press <kbd>ctrl</kbd> <kbd>r</kbd> again to toggle sort  
<kbd>alt</kbd> <kbd>c</kbd> - cd into the selected directory  

# [tig](http://jonas.nitro.dk/tig/manual.html#keys)

# vim

`vimtutor` first.
`:help [option]` then.

<kbd>ctrl</kbd><kbd>p</kbd> CtrlP
<kbd>ctrl</kbd><kbd>t</kbd> New tab
<kbd>ctrl</kbd><kbd>n</kbd> Next tab
<kbd>ctrl</kbd><kbd>b</kbd> Prev tab
<kbd>ctrl</kbd><kbd>k</kbd> Toggle sidebar
<kbd>ctrl</kbd><kbd>d</kbd> Multiple cursor down
<kbd>ctrl</kbd><kbd>u</kbd> Multiple cursor up
<kbd>ctrl</kbd><kbd>w</kbd><kbd>w</kbd> Cycle windows: go next
<kbd>ctrl</kbd><kbd>w</kbd><kbd>h</kbd> Go window left
<kbd>ctrl</kbd><kbd>w</kbd><kbd>j</kbd> Go window down
<kbd>ctrl</kbd><kbd>w</kbd><kbd>k</kbd> Go window up
<kbd>ctrl</kbd><kbd>w</kbd><kbd>l</kbd> Go window right
<kbd>ctrl</kbd><kbd>w</kbd><kbd>q</kbd> Close tab

## create a file

`:e somefile.txt` - in current file's directory (via `autocmd BufEnter * lcd %:p:h ` in <div class="vimrc"></div>)

`m` and then `a` in NERDTree (dirname must end with `/`)

## misc

`:e ++enc=cp1251`
`:set syntax=tt2html`
`!22jsort` - sort current & 22 next lines via \`sort\` (short for `:.,.+22!sort`)

## modes

### insert

`:help Insert-mode`

<kbd>ctrl</kbd><kbd>o</kbd> switch from insert to normal mode just for one command

### normal

`:help Normal-mode`

go insert mode with:
<kbd>a</kbd> append after cursor
<kbd>i</kbd> insert before cursor
<kbd>A</kbd> append at end of line
<kbd>I</kbd> insert at beginning of line
<kbd>C</kbd> change to end of line
<kbd>s</kbd> substitute characters

### visual

`:help Visual-mode`

There are three different types of highlighting in visual mode. Each allows the user to highlight text in different ways. Commands that normally only affect one character, line, or area will affect the highlighted text (such as changing text to uppercase (<kbd>Ctrl</kbd><kbd>~</kbd>), deleting text (<kbd>d</kbd>), indenting lines (>>, <<, and =), and so forth).

### plain visual mode

<kbd>v</kbd>

### block visual mode

`:help visual-block`

<kbd>ctrl</kbd><kbd>v</kbd>

### linewise visual mode

<kbd>shift</kbd><kbd>b</kbd>


## links
- [per project .vimrc](https://github.com/MarcWeber/vim-addon-local-vimrc)
- [change syntax by extension](http://vim.wikia.com/wiki/Forcing_Syntax_Coloring_for_files_with_odd_extensions)
