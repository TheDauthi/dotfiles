# TheDauthi's dotfiles

### Installation
```bash
git clone https://github.com/TheDauthi/dotfiles.git ~/.shellrc/dotfiles && bash ~/.shellrc/dotfiles/install
```

My dotfiles should work on OSX, linux, and Cygwin.  They're based on a fairly bare-bones Debian setup, as that's what I spend most of my time inside.  On OSX, I use [brew](http://brew.sh), and as much of the GNU userland as possible.  I use zsh with oh-my-zsh, but this setup also supports bash/bash-completion if zsh is not installed. On OSX, I install the GNU toolset in place of most of the BSD ones. While most scripts support BSD, I don't test there.

On OSX, install [brew](http://brew.sh) first. The install in setup.d should work, but it's not called automatically on setup in case there is an existing brew install that you don't want to overwrite.

I use [dotbot](https://github.com/anishathalye/dotbot) to manage my dotfiles, installing the repository itself into `.shellrc/dotfiles`.  I then symlink the directories into the .shellrc directory, which is what is actually included into PATH. Most importantly, this allows another user to load the shellrc without issue, usually useful for shared settings or after a su login. The top level `.shellrc` will also have `local.d` a directory, which contain machine-specific settings.

One thing that a user might want to change is the use of byobu to tmux. I haven't because byobu has given me better  cross-platform terminal reconnection.

### Structure
The top-level directory in my home that contains my dotfiles is called `.shellrc`.  This directory contains the git repository itself and all of the necessary directories.

### Included

Some features:
- language-env: loads autodetected plenv/pyenv/rbenv/nodenv environments
- pretty-mount: mount with no options is prettified
- HTTPVERBS: GET/POST/PUT/DELETE/TRACE/OPTIONS are callable as "GET http://www.google.com". 

Some additional functions are packaged:
- pathprepend, pathappend: Treats $PATH as a stack and pushes/shifts arguments onto it.
- is_cygwin/is_debian/is_osx: Consistent platform detection
- _cleanup_path: Treats $PATH as an array and de-dupes it. This is most useful on Cygwin, as duplicate $PATH entries may be searched.
- _detect_shell: Detects shell without using $SHELL. During some types of sessions, $SHELL can be the preferred shell instead of the actual.

As well as scripts:
- dirsize: get the real directory size instead of the inode size.
- eachdir: cd into each matching directory, then run a command. Sure, you can do it with find/xargs, or you can save 5 minutes each time you would need to look it up
- pid: Retrieves the pid of executables matching an expression
- run-parts.sh: run-parts is a well-known script, but it doesn't exist everywhere. This is a pure-shell implementation giving 95% of the features.
- serve: the old python http program


### Rationale
For years, I've hesitated committing dotfiles to source control.  "I don't have a lot in there," I said.  "I don't want to have to set it up on every machine I work on," I said.  I don't have a fancy `.vimrc`, or use zsh.
