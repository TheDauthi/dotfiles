# TheDauthi's dotfiles

### Installation
```bash
git clone https://github.com/TheDauthi/dotfiles.git ~/.shellrc/dotfiles && bash ~/.shellrc/dotfiles/install
```

My dotfiles should work on OSX and linux.  They're based on a fairly bare-bones Ubuntu setup, as that's what I spend most of my time inside.  On OSX, I use [brew](http://brew.sh), and as much of the GNU userland as possible.  I use Bash 4, Bash Completion 2, and GNU find.  These will be installed if you are on OSX.

On OSX, install [brew](http://brew.sh) first.

I use [dotbot](https://github.com/anishathalye/dotbot) to manage my dotfiles, installing the repository itself into `.shellrc/dotfiles`.  I then symlink the directories into the .shellrc directory, which is what is actually included into PATH, and can even be loaded by other users.  The `.shellrc` will also have `local.d` and `login.d` directories, which contain machine-specific settings for non-login and login shells, respectively.

### Structure
The top-level directory in my home that contains my dotfiles is called `.shellrc`.  This directory contains the git repository itself and all of the necessary directories.

### Rationale
For years, I've hesitated committing dotfiles to source control.  "I don't have a lot in there," I said.  "I don't want to have to set it up on every machine I work on," I said.  I don't have a fancy `.vimrc`, or use zsh.
