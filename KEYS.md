# Key bindings

<!-- MarkdownTOC autolink=true autoanchor=true bracket=round depth=0 -->

- [bash](#bash)
    - [fzf](#fzf)
    - [marker](#marker)
- [tig](#tig)
- [vim](#vim)
    - [General bindings:](#general-bindings)
    - [Misc plugins:](#misc-plugins)
    - [NERDTree:](#nerdtree)
    - [commands](#commands)
    - [modes](#modes)
        - [insert](#insert)
        - [normal](#normal)
        - [visual](#visual)

<!-- /MarkdownTOC -->

<a name="bash"></a>
# bash

<kbd>ctrl</kbd><kbd>w</kbd> - Delete the word before the cursor  
<kbd>ctrl</kbd><kbd>k</kbd> - Delete to the end of line  
<kbd>ctrl</kbd><kbd>u</kbd> - Delete to the beginning of line  
<kbd>ctrl</kbd><kbd>l</kbd> - Clear  
<kbd>esc</kbd> <kbd>backspace</kbd> - Delete all alphanumeric symbols before the cursor, f.e. `/some/path` -> `/some/`  
<kbd>esc</kbd> <kbd>b</kbd> - Jump one word left  
<kbd>esc</kbd> <kbd>f</kbd> - Jump one word right  
<kbd>esc</kbd> <kbd>t</kbd> - Swap two words before the cursor  
<kbd>esc</kbd> <kbd>.</kbd> - Paste the last argument of the previous command  

<a name="fzf"></a>
## [fzf](https://github.com/junegunn/fzf)
<kbd>ctrl</kbd><kbd>t</kbd> - Paste the selected files and directories onto the command line  
<kbd>ctrl</kbd><kbd>r</kbd> - Paste the selected command from history onto the command line. Sort is disabled by default to respect chronological ordering. Press <kbd>ctrl</kbd><kbd>r</kbd> again to toggle sort  
<kbd>alt</kbd><kbd>c</kbd> - cd into the selected directory  

<a name="marker"></a>
## [marker](http://pindexis.github.io/marker/)
<kbd>ctrl</kbd><kbd>space</kbd> - Search for commands that match the current written string  
<kbd>ctrl</kbd><kbd>f</kbd> - place the cursor at the next placeholder, identified by the `%%` word or by `{{example}}`  
<kbd>ctrl</kbd><kbd>s</kbd> - Mark (save) the current written command string to the user_commands.txt (gitignored)  

<a name="tig"></a>
# [tig](http://jonas.nitro.dk/tig/manual.html#keys)

<a name="vim"></a>
# vim

`vimtutor` first, `:help [option]` then.

<a name="general-bindings"></a>
## General bindings:

<kbd>ctrl</kbd><kbd>s</kbd> Update (save) file  
<kbd>ctrl</kbd><kbd>w</kbd> <kbd>q</kbd> Close tab  
<kbd>ctrl</kbd><kbd>a</kbd> <kbd>q</kbd> Force close tab without saving  
<kbd>ctrl</kbd><kbd>a</kbd> <kbd>a</kbd> Force quit (close all tabs without saving)  
<kbd>ctrl</kbd><kbd>t</kbd> New tab  
<kbd>ctrl</kbd><kbd>n</kbd> Next tab  
<kbd>ctrl</kbd><kbd>b</kbd> Prev tab  
<kbd>ctrl</kbd><kbd>w</kbd> <kbd>w</kbd> Cycle windows: go next  
<kbd>ctrl</kbd><kbd>w</kbd> <kbd>h</kbd> Go window left  
<kbd>ctrl</kbd><kbd>w</kbd> <kbd>j</kbd> Go window down  
<kbd>ctrl</kbd><kbd>w</kbd> <kbd>k</kbd> Go window up  
<kbd>ctrl</kbd><kbd>w</kbd> <kbd>l</kbd> Go window right  
<kbd>ctrl</kbd><kbd>k</kbd> Toggle sidebar (NERDTree-tabs)  
<kbd>ctrl</kbd><kbd>v</kbd> Paste (in insert or visual mode)  
<kbd>ctrl</kbd><kbd>c</kbd> Copy (in visual mode) or Exit insert mode  

<a name="misc-plugins"></a>
## Misc plugins:

<kbd>ctrl</kbd><kbd>p</kbd> CtrlP  
<kbd>ctrl</kbd><kbd>d</kbd> Multiple cursor down  
<kbd>ctrl</kbd><kbd>u</kbd> Multiple cursor up  
<kbd>ctrl</kbd><kbd>y</kbd> <kbd>\\</kbd> Emmet  
<kbd>\\</kbd> <kbd>g</kbd> Toggle GitGutter  
<kbd>\\</kbd> <kbd>/</kbd> Toggle line comment in normal and insert modes, toggle block comment in visual mode (TComment)  
<kbd>ctrl</kbd><kbd>f</kbd> Ack (ag)  

<a name="nerdtree"></a>
## NERDTree:

<kbd>m</kbd> <kbd>a</kbd> create (dirname must end with `/`)  
<kbd>m</kbd> <kbd>d</kbd> delete  
<kbd>m</kbd> <kbd>m</kbd> move  
<kbd>m</kbd> <kbd>r</kbd> reveal in Finder (macOS specific)  


<a name="commands"></a>
## commands

`:e somefile.txt` - create a in current file's directory (current directory is determined via `autocmd BufEnter * lcd %:p:h ` in .vimrc)  
`:e ++enc=cp1251`  
`:set syntax=tt2html`  
`!22jsort` - sort current & 22 next lines via \`sort\` (short for `:.,.+22!sort`)  

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

<kbd>a</kbd> append after cursor  
<kbd>i</kbd> insert before cursor  
<kbd>A</kbd> append at end of line  
<kbd>I</kbd> insert at beginning of line  
<kbd>C</kbd> change to end of line  
<kbd>s</kbd> substitute characters  

<a name="visual"></a>
### visual

`:help Visual-mode`

There are three different types of highlighting in visual mode. Each allows the user to highlight text in different ways. Commands that normally only affect one character, line, or area will affect the highlighted text (such as changing text to uppercase (<kbd>Ctrl</kbd><kbd>~</kbd>), deleting text (<kbd>d</kbd>), indenting lines (>>, <<, and =), and so forth).

<kbd>v</kbd> - plain visual mode  
<kbd>ctrl</kbd><kbd>v</kbd> - block visual mode, `:help visual-block`  
<kbd>shift</kbd><kbd>v</kbd> - linewise visual mode  



