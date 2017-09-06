# Emoji in commits

The `git k` shortcut currently contains a reference to `emojify`.  So it won't work unless it's installed and working.

## OSX

The shortest path is to install a ruby gem via:

`gem install terminal-emojify --user-install -n~/.local/bin` (or wherever you wan to install)

Double check: `less` needs to be version 471 or higher

## Linux

There is a git repository with a shell script that attempts to emojify things.  There are definitely bugs though: 
- concurrent, non-spaced emoji aren't read 
- may still be a problem with backslashes and git branches

But it's the only real option.

github.com/mrowa44/emojify

