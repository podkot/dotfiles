- `ag [FILE-TYPE] [OPTIONS] PATTERN [PATH]` - [the_silver_searcher](https://github.com/ggreer/the_silver_searcher), a code searching tool similar to ack, with a focus on speed
- `calc EXPR` - Simple calculator
- `crlf [file] [--force]` - Find files with Windows line endings (and convert them to Unix in force mode)
- `digga` - Run `dig` and display the most useful info
- `e [PATH]` - With no arguments opens the current directory in $EDITOR, otherwise opens the given location
- `fs PATH` - Determine size of a file or total size of a directory
- `g [match]`  - Quick grep: ag, ack or grep
- `gitree COMMAND` - recursively traverse directory tree for git repositories, run git command, e.g. `gittree status`, `gittree diff`
- `licen mit > LICENSE` - [licen](https://github.com/lord63/licen) generates license files
- `mkd DIR` - Create a new directory and enter it
- `o [PATH]` - with no arguments opens the current directory, otherwise opens the given location
- `phpserver [port]` - Start a PHP server from a directory, optionally specifying the port (Requires PHP 5.4.0+)
- `r ABBR` - [sman](https://github.com/tokozedg/sman), a command-line snippet manager. `s s ABBR` for show, `r ABBR` for run, `s ls` for list
- `release major|minor|patch` - Releases the next version of the product to npm or Bower
- `server [port]` - Start an HTTP server from a directory, optionally specifying the port 
- `shipit` - [Minimalistic SSH deployment](https://github.com/sapegin/shipit)
- `tre` - is a shorthand for `tree` with hidden files and color enabled, ignoring the `.git` directory, listing directories first. The output gets piped into `less` with options to preserve color and line numbers, unless the output is small enough for one screen.


# bash tips

- `^foo^bar` - rerun last command with substring substitution, e.g. s/foo/bar/. `^foo` rerun with substring deletion, s/foo//

- `sudo !!` - rerun last command as root.

- `<space>command` - space before command prevents it to be saved in history.

