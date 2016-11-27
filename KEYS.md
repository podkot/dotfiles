# Key bindings

<!-- MarkdownTOC autolink=true autoanchor=true bracket=round depth=0 -->

- [bash](#bash)
- [tig](#tig)
- [vim](#vim)
    - [commands](#commands)
    - [modes](#modes)
        - [insert](#insert)
        - [normal](#normal)
        - [visual](#visual)
        - [plain visual mode](#plain-visual-mode)
        - [block visual mode](#block-visual-mode)
        - [linewise visual mode](#linewise-visual-mode)

<!-- /MarkdownTOC -->

<a name="bash"></a>
# bash

__[fzf](https://github.com/junegunn/fzf)__  
<kbd>ctrl</kbd> <kbd>t</kbd> - Paste the selected files and directories onto the command line  
<kbd>ctrl</kbd> <kbd>r</kbd> - Paste the selected command from history onto the command line. Sort is disabled by default to respect chronological ordering. Press <kbd>ctrl</kbd> <kbd>r</kbd> again to toggle sort  
<kbd>alt</kbd> <kbd>c</kbd> - cd into the selected directory  

<a name="tig"></a>
# [tig](http://jonas.nitro.dk/tig/manual.html#keys)

<a name="vim"></a>
# vim

`vimtutor` first, `:help [option]` then.

General bindings:

- <kbd>ctrl</kbd><kbd>s</kbd> Update (save) file
- <kbd>ctrl</kbd><kbd>w</kbd><kbd>q</kbd> Close tab
- <kbd>ctrl</kbd><kbd>a</kbd><kbd>q</kbd> Force close tab without saving
- <kbd>ctrl</kbd><kbd>a</kbd><kbd>a</kbd> Force quit (close all tabs without saving)
- <kbd>ctrl</kbd><kbd>t</kbd> New tab
- <kbd>ctrl</kbd><kbd>n</kbd> Next tab
- <kbd>ctrl</kbd><kbd>b</kbd> Prev tab
- <kbd>ctrl</kbd><kbd>w</kbd><kbd>w</kbd> Cycle windows: go next
- <kbd>ctrl</kbd><kbd>w</kbd><kbd>h</kbd> Go window left
- <kbd>ctrl</kbd><kbd>w</kbd><kbd>j</kbd> Go window down
- <kbd>ctrl</kbd><kbd>w</kbd><kbd>k</kbd> Go window up
- <kbd>ctrl</kbd><kbd>w</kbd><kbd>l</kbd> Go window right
- <kbd>ctrl</kbd><kbd>k</kbd> Toggle sidebar (NERDTree-tabs)
- <kbd>ctrl</kbd><kbd>v</kbd> Paste (in insert or visual mode)
- <kbd>ctrl</kbd><kbd>c</kbd> Copy (in visual mode) or Exit insert mode

Misc plugins:

- <kbd>ctrl</kbd><kbd>p</kbd> CtrlP
- <kbd>ctrl</kbd><kbd>d</kbd> Multiple cursor down
- <kbd>ctrl</kbd><kbd>u</kbd> Multiple cursor up
- <kbd>ctrl</kbd><kbd>y</kbd><kbd>\</kbd> Emmet
- <kbd>\</kbd><kbd>g</kbd> Toggle GitGutter
- <kbd>\</kbd><kbd>/</kbd> Toggle line comment in normal and insert modes, toggle block comment in visual mode (TComment)
- <kbd>ctrl</kbd><kbd>f</kbd> Ack (ag)

NERDTree:

- <kbd>m</kbd><kbd>a</kbd> create (dirname must end with `/`)
- <kbd>m</kbd><kbd>d</kbd> delete
- <kbd>m</kbd><kbd>m</kbd> move
- <kbd>m</kbd><kbd>r</kbd> reveal in Finder (macOS specific)


<a name="commands"></a>
## commands

- `:e somefile.txt` - create a in current file's directory (current directory is determined via `autocmd BufEnter * lcd %:p:h ` in .vimrc)
- `:e ++enc=cp1251`
- `:set syntax=tt2html`
- `!22jsort` - sort current & 22 next lines via \`sort\` (short for `:.,.+22!sort`)

<a name="modes"></a>
## modes

<a name="insert"></a>
### insert

`:help Insert-mode`

<kbd>ctrl</kbd><kbd>o</kbd> switch from insert to normal mode just for one command

<a name="normal"></a>
### normal

`:help Normal-mode`

go insert mode with:
- <kbd>a</kbd> append after cursor
- <kbd>i</kbd> insert before cursor
- <kbd>A</kbd> append at end of line
- <kbd>I</kbd> insert at beginning of line
- <kbd>C</kbd> change to end of line
- <kbd>s</kbd> substitute characters

<a name="visual"></a>
### visual

`:help Visual-mode`

There are three different types of highlighting in visual mode. Each allows the user to highlight text in different ways. Commands that normally only affect one character, line, or area will affect the highlighted text (such as changing text to uppercase (<kbd>Ctrl</kbd><kbd>~</kbd>), deleting text (<kbd>d</kbd>), indenting lines (>>, <<, and =), and so forth).

<a name="plain-visual-mode"></a>
### plain visual mode

<kbd>v</kbd>

<a name="block-visual-mode"></a>
### block visual mode

`:help visual-block`

<kbd>ctrl</kbd><kbd>v</kbd>

<a name="linewise-visual-mode"></a>
### linewise visual mode

<kbd>shift</kbd><kbd>v</kbd>

