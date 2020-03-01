# dotfiles

## Installation

Execute the `install.sh` script:

```
$ ./install.sh
```

If this is the first time the script is being run, it will prompt for an email address to use in `~/.gitconfig`:

```
$ ./install.sh
Removing existing dot files...
Enter email for .gitconfig:
```

Once an email is entered, it will not prompt again on future installations unless the generated file `git/.gitconfig_link` is deleted.
