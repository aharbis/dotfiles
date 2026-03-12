# dotfiles

## Installation

Execute the `install.sh` script:

```
$ ./install.sh
```

If this is the first time the script is being run, it will prompt for the name and email address to use in `~/.gitconfig`:

```
$ ./install.sh
Removing existing dot files...
Enter name for .gitconfig: John Doe
Enter email for .gitconfig: john@example.com
```

Once the prompt(s) are answered, it will not prompt again on future installations unless the generated file `git/.gitconfig_link` is deleted.
